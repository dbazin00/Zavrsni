package chatapp

class DataUser {
    String username
    String mail
    String first_name
    String last_name
    String password
    Date birthday
//    String birthplace
    static constraints = {
        username(unique: true)
        mail(email: true)
        first_name()
        last_name()
        password()
        birthday(date: true)
//        birthplace(inList: ["Split", "Zagreb", "Rijeka", "Osijek"])
    }
}
