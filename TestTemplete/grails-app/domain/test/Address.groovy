package test

class Address {

    static constraints = {
        postal(nullable: true)
        email(nullable: true)
        mobile(nullable: true)
        isActive(nullable: true)
        student(nullable: true)
    }
    String postal
    String email
    String mobile
    Boolean isActive
    Student student

}
