package linkshare

class ReadingItem {
    Resource resource;
    User user;
    Boolean isRead;
    static belongsTo=[users:User , resources:Resource]
    static constraints = {

    }
    static mapping = {
        table 'ReadingItem'
    }
}
