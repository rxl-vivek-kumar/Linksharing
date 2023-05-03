package linkshare


class Topic {

    String name;
    User createdBy;
    Date dateCreated;
    Date lastUpdated;
    static hasMany = [resources:Resource,subscriptions:Subscription]
    static belongsTo=[createdBy:User]
    static constraints = {
        name unique: true
    }
    static mapping={
        table 'Topic'
        name column: 'name'
        createdBy column: 'createdBy'
        lastUpdated column: 'lastUpdated'
    }
}
