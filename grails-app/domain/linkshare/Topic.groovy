package linkshare
import linkshare.VisibilityEnum
class Topic {

    String name;
    Date dateCreated;
    Date lastUpdated;
    VisibilityEnum visibility;
    static hasMany = [resource:Resource,subscription:Subscription]
    static belongsTo=[createdBy:User]
    static constraints = {
        visibility nullable:false
    }
}
