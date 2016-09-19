package test

class Qualification {

    static constraints = {
        degree(nullable: true)
        student(nullable: true)
    }
    String degree
    Student student
}
