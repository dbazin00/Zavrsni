package chatapp

class DataUser {
    static transients = ['age']

    String username
    String mail
    String first_name
    String last_name
    String password
    Date birthday
    Integer age
    String birthplace
    String gender
    static constraints = {
        username(unique: true)
        mail(email: true)
        first_name()
        last_name()
        password()
        birthday(date: true)
        birthplace(inList: ["Split", "Zagreb", "Rijeka", "Osijek", "Other"])
        gender()
}
}
