package chatapp

import grails.gorm.transactions.Transactional
import org.grails.datastore.mapping.query.Query.In

@Transactional
class MessageService {

    def createNewMessage(DataUser sender, DataUser receiver, String message, String fileN, byte[] file) {
//        Message m=new Message(message: "Test", reciever: "Admin",sender:sender,  send_date:new Date())
//        m.save(flush:true);

        Message m=new Message()
        m.sender = sender
        m.receiver = receiver
        m.message_text = message
        m.send_date = new Date()
        m.read = false
        m.filedata=file
        m.filename = fileN

        m.save(flush:true)
    }
}
