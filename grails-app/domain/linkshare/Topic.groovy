package linkshare

import Enum.VisibilityEnum


class Topic {

    String name;
    User createdBy;
    Date dateCreated;
    Date lastUpdated;
    VisibilityEnum visibility;
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
