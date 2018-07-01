package chatapp

import groovy.sql.Sql

class UserController {
    def dataUserService
    def messageService
    def dataSource
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
    def registration() {
    }

    def registerNewUser()
    {//new Date().parse("yyyy-MM-dd",params["birthday"])
        try {
            dataUserService.registerUser(params.first_name, params.last_name, params.username, params.password, params.mail, new Date().parse("yyyy-MM-dd", params["birthday"]), params.birthplace)
            redirect(view: 'index')
        }
        catch(Exception e)
        {
            flash.message = "Username already exists!!!"
            redirect(action: 'registration')
        }
    }

    //lista svih korisnika osim prijavljenog
    def userList()
    {
        if(session.currentUserID == null)
            redirect(view: 'index')


        //svi korisnici koji su razliciti od orijavljenog i search
        def persons = DataUser.createCriteria().list (params) {
            if (params.query) {
                ilike("username", "%${params.query}%")
            }
            not{idEq(session.currentUserID) }
        }
        for (int i = 0; i < persons.size(); i++) {
            persons[i].age = new Date().year - persons[i].birthday.year
        }

        [persons:persons]
        //transients
    }


    def userInformation()
    {
        try {
            if (session.currentUserID == null) {
                redirect(view: 'index')
            }
            def userInfo = DataUser.findByUsername(params.id)
            [userInf: userInfo]
        }
        catch(Exception e)
        {
            redirect(view: 'index')
        }
    }

    //update profila
    def myProfile()
    {
        if(session.currentUserID == null)
            redirect(view: 'index')
        else {
            def userProfile = DataUser.findById(session.currentUserID)
            [userProfile: userProfile]
        }
    }

    def saveProfile()
    {
        if(session.currentUserID == null)
            redirect(view: 'index')
        def saveUser = DataUser.findById(session.currentUserID)

        saveUser.first_name = params.first_name
        saveUser.last_name = params.last_name
        saveUser.birthplace = params.birthplace
        saveUser.save(flush:true)
        redirect(action: 'myProfile')
    }

    def allConversations()
    {
        if (session.currentUserID == null) {
            redirect(view: 'index')
        }

        def sid = session.currentUserID
        def allUsers = DataUser.findAllByIdNotEqual(sid).toList()
        def sql = new Sql(dataSource)
        def allConvers = []


        //trazenje zadnje poruke razgovora izmedu dva korisnika
        for(int i = 0; i < allUsers.size(); i++) {

            def rows = sql.firstRow("SELECT * from message WHERE (receiver_id = " + sid + " OR receiver_id =" + allUsers[i].id + ") AND (sender_id = " + sid + " OR sender_id = " + allUsers[i].id + ") ORDER BY send_date DESC")
            if(rows != null)
                allConvers.add(rows)
        }

        //spremanje broja neprocitanih razgovora u transients

        for(int i = 0; i < allConvers.size(); i++)
        {
            if(allConvers[i].receiver_id == sid)
            {
                allConvers[i].unreadMessages = Message.countByReadAndReceiverAndSender(false, DataUser.findById(allConvers[i].receiver_id), DataUser.findById(allConvers[i].sender_id))
            }
            else
            {
                allConvers[i].unreadMessages = Message.countByReadAndReceiverAndSender(false, DataUser.findById(allConvers[i].sender_id), DataUser.findById(allConvers[i].receiver_id))
            }
        }

        sql.close()

        allConvers = allConvers.sort{ it.send_date}.reverse()

        [allConvers: allConvers]
    }

    def allMessages()
    {
        def sid = session.currentUserID
        session.chatFriend = params.id
        def fid = session.chatFriend
        def sql = new Sql(dataSource)

        //dohvacanje svih poruka izmedju dva korisnika

        def messages = sql.rows("SELECT * from message WHERE (receiver_id = " + sid + " OR receiver_id =" + params.id + ") AND (sender_id = " + sid + " OR sender_id = " + params.id + ") ORDER BY send_date DESC").toList()

//        messages.each {
//            println (it.filedata)
//        }

        def userS = DataUser.findById(sid)
        def userF = DataUser.findById(fid)

        //poruka procitana

        def messageRead = Message.findAllByReceiverAndSender(userS, userF)
        messageRead.each {
            it.read = true
            it.save(flush:true)
        }

        messageRead.each {
        it.read = true
        it.save(flush: true)
    }


        sql.close()

        [messages: messages]

}

    def sendMessage()
    {
        if(params.message_body != '') {
            def sender = DataUser.findById(session.currentUserID)
            def receiver = DataUser.findById(session.chatFriend)
            def fileUser = params.userFile
//            println fileUser.getBytes()
            messageService.createNewMessage(sender, receiver, params.message_body, fileUser, fileUser.getBytes())
            redirect(action: 'allMessages', id: session.chatFriend)
        }
        else {
            redirect(action: 'allMessages', id: session.chatFriend)
        }
    }
    def downloadFile()
    {
        def userFile = Message.get(params.id)
        response.setHeader("Content-disposition","attachment;filename="+userFile.filename)
        response.outputStream << userFile.filedata
        response.outputStream.flush()

    }
}
