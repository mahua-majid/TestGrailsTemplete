<%=packageName ? "package ${packageName}\n\n" : ''%>

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ${className}Controller {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        ${className}.async.task {
            [${propertyName}List: list(params), count: count() ]
        }.then { result ->
            respond result.${propertyName}List, model:[${propertyName}Count: result.count]
        }
    }

    def show(String id) {
        ${className}.async.get(id).then { ${propertyName} ->
            respond ${propertyName}
        }
    }

    def create() {
        respond new ${className}(params)
    }

    def save(${className} ${propertyName}) {
        ${className}.async.withTransaction {
            if (${propertyName} == null) {
                notFound()
                return
            }

            if(${propertyName}.hasErrors()) {
                respond ${propertyName}.errors, view:'create' // STATUS CODE 422
                return
            }

            ${propertyName}.save flush:true

            if (${className}.hasMany.size() > 0) {
                detail(${propertyName}, params)
            }

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: '${propertyName}.label', default: '${className}'), ${propertyName}.id])
                    redirect ${propertyName}
                }
                '*' { respond ${propertyName}, [status: CREATED] }
            }
        }
    }

    def edit(String id) {
        ${className}.async.get(id).then { ${propertyName} ->
            respond ${propertyName}
        }
    }

    def update(String id) {
        ${className}.async.withTransaction {
            def ${propertyName} = ${className}.get(id)
            if (${propertyName} == null) {
                notFound()
                return
            }

            ${propertyName}.properties = params
            if( !${propertyName}.save(flush:true) ) {
                respond ${propertyName}.errors, view:'edit' // STATUS CODE 422
                return
            }

            if (${className}.hasMany.size() > 0) {
                detail(${propertyName}, params)
            }


            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: '${className}.label', default: '${className}'), ${propertyName}.id])
                    redirect ${propertyName}
                }
                '*'{ respond ${propertyName}, [status: OK] }
            }
        }
    }

    def delete(String id) {
        ${className}.async.withTransaction {
            def ${propertyName} = ${className}.get(id)
            if (${propertyName} == null) {
                notFound()
                return
            }

            ${propertyName}.delete flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: '${className}.label', default: '${className}'), ${propertyName}.id])
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
            }
        }
    }

    @Transactional
    def clone(${className} ${propertyName}) {

        if (request.method == 'POST') {
            if (${propertyName} == null) {
                notFound()
                return
            }

            if (${propertyName}.hasErrors()) {
                respond ${propertyName}.errors, view: 'create'
                return
            }

            ${propertyName}.id = null
            ${propertyName}.save flush: true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])
                    redirect $ {propertyName}
                }
                '*' { respond $ {propertyName}, [status: CREATED] }
            }
        }

        respond ${propertyName}
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: '${propertyName}.label', default: '${className}'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def detail(${propertyName}, params){
        int i = 1

        /* while (params["classProperty"+i+"propertyName"] != null && params["classProperty"+i+"propertyName"] != "") {
             def detailInstance = new ClassName()

             if (params["classProperty" + i + "deleted"] == "true" && params["classProperty" + i + "new"] == "false") {
                 detailInstance = ClassName.get(Long.valueOf(params["classProperty" + i + "id"]))
                 detailInstance.delete()
                 i++
                 continue
             } else if (params["classProperty" + i + "deleted"] == "false" && params["classProperty" + i + "new"] == "true") {
                 detailInstance = new ClassName()
             } else if (params["classProperty" + i + "deleted"] == "false" && params["classProperty" + i + "new"] == "false"){
                 detailInstance = ClassName.get(Long.valueOf(params["classProperty" + i + "id"]))
             }else if (params["classProperty" + i + "deleted"] == "true" && params["classProperty" + i + "new"] == "true") {
                 i++
                 continue
             }


             // add all property

             if(params["classProperty"+i+"propertyName"]){
                 detailInstance.propertyName = params[params["classProperty"+i+"propertyName"]]
             }

             detailInstance.set${className}(${propertyName})

             detailInstance.save flush: true
             i++
         }*/
    }
}
