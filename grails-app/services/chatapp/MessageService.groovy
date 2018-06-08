package chatapp

import grails.gorm.transactions.Transactional

@Transactional
class MessageService {

    def createNewMessage(String sender) {
//        Message m=new Message(message: "Test", reciever: "Admin",sender:sender,  send_date:new Date())
//        m.save(flush:true);
    }
}
