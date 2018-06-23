package chatapp

class Message {
    static transients = ['unreadMessages']

    String message_text
    Date send_date
    DataUser sender
    DataUser receiver
    boolean read
    Integer unreadMessages
    byte[] filedata
    static constraints = {
        message_text()
        send_date()
        sender()
        receiver()
        read()
        filedata(maxSize: 1024 * 1024 * 20, nullable: true)
    }
}
