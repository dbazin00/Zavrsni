package chatapp

class Message {
    String message_text
    Date send_date
    DataUser sender
    DataUser receiver
    boolean read
    static constraints = {
        message_text()
        send_date()
        sender()
        receiver()
        read()
    }
}
