package chatapp

import grails.gorm.transactions.Transactional

@Transactional
class DataUserService {

    def registerUser(String firstN, String lastN, String userN, String pass, String mail, Date birthD) {

        def newUser = new DataUser()
        newUser.first_name = firstN
        newUser.last_name = lastN
        newUser.username = userN
        newUser.password = pass
        newUser.mail = mail
        newUser.birthday = birthD
        newUser.save(flush:true, failOnError:true)
    }
}
