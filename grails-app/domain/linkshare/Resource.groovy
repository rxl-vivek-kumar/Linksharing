package linkshare

class Resource {
    String description
    Date dateCreated
    Date lastUpdated
    static belongsTo=[topic:Topic,createdBy:User]
    static hasMany= [readingItems:ReadingItem, resourceRatings:ResourceRating]
    static constraints = {
    }
    static mapping={
        table 'Resource_Table'
    }
}
