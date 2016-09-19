package test


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CourseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Course.list(params), model: [courseInstanceCount: Course.count()]
    }

    def show(Course courseInstance) {
        respond courseInstance
    }

    def create() {
        respond new Course(params)
    }

    @Transactional
    def save(Course courseInstance) {
        if (courseInstance == null) {
            notFound()
            return
        }

        if (courseInstance.hasErrors()) {
            respond courseInstance.errors, view: 'create'
            return
        }

        courseInstance.save flush: true

        if (Course.hasMany.size() > 0) {
            detail(courseInstance, params)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])
                redirect courseInstance
            }
            '*' { respond courseInstance, [status: CREATED] }
        }
    }

    def edit(Course courseInstance) {
        respond courseInstance
    }

    @Transactional
    def update(Course courseInstance) {
        if (courseInstance == null) {
            notFound()
            return
        }

        if (courseInstance.hasErrors()) {
            respond courseInstance.errors, view: 'edit'
            return
        }

        courseInstance.save flush: true

        if (Course.hasMany.size() > 0) {
            detail(courseInstance, params)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Course.label', default: 'Course'), courseInstance.id])
                redirect courseInstance
            }
            '*' { respond courseInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Course courseInstance) {

        if (courseInstance == null) {
            notFound()
            return
        }

        courseInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Course.label', default: 'Course'), courseInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Transactional
    def clone(Course courseInstance) {

        if (request.method == 'POST') {
            if (courseInstance == null) {
                notFound()
                return
            }

            if (courseInstance.hasErrors()) {
                respond courseInstance.errors, view: 'create'
                return
            }

            courseInstance.id = null
            courseInstance.save flush: true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])
                    redirect courseInstance
                }
                '*' { respond courseInstance, [status: CREATED] }
            }
        }

        respond courseInstance
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def detail(courseInstance, params) {

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

             detailInstance.setCourse(courseInstance)

             detailInstance.save flush: true
             i++
         }*/
    }
}
