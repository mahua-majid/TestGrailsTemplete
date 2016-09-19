package test


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StudentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Student.list(params), model: [studentInstanceCount: Student.count()]
    }

    def show(Student studentInstance) {
        respond studentInstance
    }

    def create() {
        respond new Student(params)
    }

    @Transactional
    def save(Student studentInstance) {
        if (studentInstance == null) {
            notFound()
            return
        }

        if (studentInstance.hasErrors()) {
            respond studentInstance.errors, view: 'create'
            return
        }

        studentInstance.save flush: true

        if (Student.hasMany.size() > 0) {
            detail(studentInstance, params)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'student.label', default: 'Student'), studentInstance.id])
                redirect studentInstance
            }
            '*' { respond studentInstance, [status: CREATED] }
        }
    }

    def edit(Student studentInstance) {
        respond studentInstance
    }

    @Transactional
    def update(Student studentInstance) {
        if (studentInstance == null) {
            notFound()
            return
        }

        if (studentInstance.hasErrors()) {
            respond studentInstance.errors, view: 'edit'
            return
        }

        studentInstance.save flush: true

        if (Student.hasMany.size() > 0) {
            detail(studentInstance, params)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Student.label', default: 'Student'), studentInstance.id])
                redirect studentInstance
            }
            '*' { respond studentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Student studentInstance) {

        if (studentInstance == null) {
            notFound()
            return
        }

        studentInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Student.label', default: 'Student'), studentInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Transactional
    def clone(Student studentInstance) {

        if (request.method == 'POST') {
            if (studentInstance == null) {
                notFound()
                return
            }

            if (studentInstance.hasErrors()) {
                respond studentInstance.errors, view: 'create'
                return
            }

            studentInstance.id = null
            studentInstance.save flush: true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'student.label', default: 'Student'), studentInstance.id])
                    redirect studentInstance
                }
                '*' { respond studentInstance, [status: CREATED] }
            }
        }

        respond studentInstance
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def detail(studentInstance, params) {

        int i = 1

        while (params["address" + i + "postal"] != null && params["address" + i + "postal"] != "") {
            def detailInstance = new Address()

            if (params["address" + i + "deleted"] == "true" && params["address" + i + "new"] == "false") {
                detailInstance = Address.get(Long.valueOf(params["address" + i + "id"]))
                detailInstance.delete()
                i++
                continue
            } else if (params["address" + i + "deleted"] == "false" && params["address" + i + "new"] == "true") {
                detailInstance = new Address()
            } else if (params["address" + i + "deleted"] == "false" && params["address" + i + "new"] == "false") {
                detailInstance = Address.get(Long.valueOf(params["address" + i + "id"]))
            } else if (params["address" + i + "deleted"] == "true" && params["address" + i + "new"] == "true") {
                i++
                continue
            }

            // add all property

            if (params["address" + i + "postal"]) {
                detailInstance.postal = params["address" + i + "postal"]
            }

            if (params["address" + i + "email"]) {
                detailInstance.email = params["address" + i + "email"]
            }

            if (params["address" + i + "mobile"]) {
                detailInstance.mobile = params["address" + i + "mobile"]
            }

            if (params["address" + i + "isActive"]) {
                detailInstance.isActive = params["address" + i + "isActive"]
            }

            detailInstance.setStudent(studentInstance)

            detailInstance.save flush: true
            i++
        }

        i = 1

        while (params["qualification" + i + "degree"] != null && params["qualification" + i + "degree"] != "") {
            def detailInstance = new Qualification()

            if (params["qualification" + i + "deleted"] == "true" && params["qualification" + i + "new"] == "false") {
                detailInstance = Qualification.get(Long.valueOf(params["qualification" + i + "id"]))
                detailInstance.delete()
                i++
                continue
            } else if (params["qualification" + i + "deleted"] == "false" && params["qualification" + i + "new"] == "true") {
                detailInstance = new Qualification()
            } else if (params["qualification" + i + "deleted"] == "false" && params["qualification" + i + "new"] == "false") {
                detailInstance = Qualification.get(Long.valueOf(params["qualification" + i + "id"]))
            } else if (params["qualification" + i + "deleted"] == "true" && params["qualification" + i + "new"] == "true") {
                i++
                continue
            }

            // add all property

            if (params["qualification" + i + "degree"]) {
                detailInstance.degree = params["qualification" + i + "degree"]
            }

            detailInstance.setStudent(studentInstance)

            detailInstance.save flush: true
            i++
        }

    }

}
