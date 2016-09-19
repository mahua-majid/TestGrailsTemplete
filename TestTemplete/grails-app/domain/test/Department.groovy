package test

class Department {

    static constraints = {
        deptName(size: 0..50, nullable: false)
    }
    String deptName
}
