<%=packageName ? "package ${packageName}\n\n" : ''%>

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ${className}Controller {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ${className}.list(params), model:[${propertyName}Count: ${className}.count()]
    }

    def show(${className} ${propertyName}) {
        respond ${propertyName}
    }

    def create() {
        respond new ${className}(params)
    }

    @Transactional
    def save(${className} ${propertyName}) {
        if (${propertyName} == null) {
            notFound()
            return
        }

        if (${propertyName}.hasErrors()) {
            respond ${propertyName}.errors, view:'create'
            return
        }

        ${propertyName}.save flush:true

        if (${className}.hasMany.size() > 0) {
            detail(${propertyName}, params)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])
                redirect ${propertyName}
            }
            '*' { respond ${propertyName}, [status: CREATED] }
        }
    }

    def edit(${className} ${propertyName}) {
        respond ${propertyName}
    }

    @Transactional
    def update(${className} ${propertyName}) {
        if (${propertyName} == null) {
            notFound()
            return
        }

        if (${propertyName}.hasErrors()) {
            respond ${propertyName}.errors, view:'edit'
            return
        }

        ${propertyName}.save flush:true

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

    @Transactional
    def delete(${className} ${propertyName}) {

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
                    redirect ${propertyName}
                }
                '*' { respond ${propertyName}, [status: CREATED] }
            }
        }

        respond ${propertyName}
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def detail(${propertyName}, params){

        int i = 1
        /*for (t in hasMany) {
            def table = t.getValue()
            def v = table.gormPersistentEntity.persistentPropertyNames

//            Address.gormPersistentEntity.persistentPropertyNames
            println(v)
        }
*/

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
