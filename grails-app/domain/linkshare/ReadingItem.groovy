package linkshare

class ReadingItem {
    Boolean isRead=false;
    static belongsTo=[user:User , resource:Resource]
    static constraints = {
    }
}
