package test

class Student {

    static constraints = {
        registrationDate(nullable: false)
    }
    static hasMany = [address: Address, qualification: Qualification]
    String name
    String registration
    Date registrationDate

}
