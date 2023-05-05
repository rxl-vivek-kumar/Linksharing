package linkshare

class Topic {

    String name;
    User createdBy;
    Date dateCreated;
    Date lastUpdated;
    VisibilityEnum visibility;
    static hasMany = [resources:Resource,subscriptions:Subscription]
    static belongsTo=[createdBy:User]
    static constraints = {
        visibility nullable:false
    }
    static mapping={
        table 'Topic'
        name column: 'name'
        createdBy column: 'createdBy'
        dateCreated column: 'dateCreated'
        lastUpdated column: 'lastUpdated'
    }
}
