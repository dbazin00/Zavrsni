package chatapp

import javax.xml.crypto.Data

class UserController {
    def dataUserService
//    def messageService
//    def DataUserService

    def index() {

    }

    //prijava korisnika u sustav

    def login () {

        DataUser user = DataUser.findByUsername(params.username)
        if(user != null)
        {
//            Integer i = persons.username.findIndexOf {params.username}
//            messageService.createNewMessage("poslao")
            if(user.password == params.password) {
                session.currentUserID = user.id
                redirect(action: 'userList')
            }
            else
            {
                flash.message = "Wrong password!!!"
                redirect(action: 'index')
            }
        }
        else
        {
            flash.message = "Wrong username!!!"
            redirect(action: 'index')
        }


    }

    def logout () {
        session.currentUserID = null
        redirect(action: 'index')
    }

    //registracija novih korisnika
    def registration() {}

    def registrateNewUser()
    {
        dataUserService.registerUser(params.first_name, params.last_name, params.username, params.password, params.mail, new Date())
        redirect(view: 'index')
    }

    //lista svih korisnika osim prijavljenog
    def userList()
    {
        if(session.currentUserID == null)
            redirect(view: 'index')
        def persons = DataUser.findAllByIdNotEqual(session.currentUserID).toList()
        [persons:persons]
    }

    //update profila
    def myProfile()
    {
        if(session.currentUserID == null)
            redirect(view: 'index')
        def userProfile = DataUser.findById(session.currentUserID)

        [userProfile: userProfile]
    }

    def saveProfile()
    {
        if(session.currentUserID == null)
            redirect(view: 'index')
        def saveUser = DataUser.findById(session.currentUserID)

        saveUser.first_name = params.first_name
        saveUser.save(flush:true)
        redirect(action: 'myProfile')
    }
    def userInformation()
    {
        DataUser userInfo = params.person
    }

}
