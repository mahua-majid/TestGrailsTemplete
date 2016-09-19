package test

class Course {

    static constraints = {
        unit(size: 0..5, nullable: false)
        courseName(size: 0..50, nullable: false)
    }
    String unit
    String courseName

}
