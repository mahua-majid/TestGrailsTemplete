package test


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DepartmentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Department.list(params), model: [departmentInstanceCount: Department.count()]
    }

    def show(Department departmentInstance) {
        respond departmentInstance
    }

    def create() {
        respond new Department(params)
    }

    @Transactional
    def save(Department departmentInstance) {
        if (departmentInstance == null) {
            notFound()
            return
        }

        if (departmentInstance.hasErrors()) {
            respond departmentInstance.errors, view: 'create'
            return
        }

        departmentInstance.save flush: true

        if (Department.hasMany.size() > 0) {
            detail(departmentInstance, params)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'department.label', default: 'Department'), departmentInstance.id])
                redirect departmentInstance
            }
            '*' { respond departmentInstance, [status: CREATED] }
        }
    }

    def edit(Department departmentInstance) {
        respond departmentInstance
    }

    @Transactional
    def update(Department departmentInstance) {
        if (departmentInstance == null) {
            notFound()
            return
        }

        if (departmentInstance.hasErrors()) {
            respond departmentInstance.errors, view: 'edit'
            return
        }

        departmentInstance.save flush: true

        if (Department.hasMany.size() > 0) {
            detail(departmentInstance, params)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Department.label', default: 'Department'), departmentInstance.id])
                redirect departmentInstance
            }
            '*' { respond departmentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Department departmentInstance) {

        if (departmentInstance == null) {
            notFound()
            return
        }

        departmentInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Department.label', default: 'Department'), departmentInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Transactional
    def clone(Department departmentInstance) {

        if (request.method == 'POST') {
            if (departmentInstance == null) {
                notFound()
                return
            }

            if (departmentInstance.hasErrors()) {
                respond departmentInstance.errors, view: 'create'
                return
            }

            departmentInstance.id = null
            departmentInstance.save flush: true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'department.label', default: 'Department'), departmentInstance.id])
                    redirect departmentInstance
                }
                '*' { respond departmentInstance, [status: CREATED] }
            }
        }

        respond departmentInstance
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'department.label', default: 'Department'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def detail(departmentInstance, params) {

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

             detailInstance.setDepartment(departmentInstance)

             detailInstance.save flush: true
             i++
         }*/
    }
}
