package linkshare

class Resource {
    String description;
    User createdBy;
    Topic topic;
    Date dateCreated;
    Date lastUpdated;
    static belongsTo=[topics:Topic,createdBy:User]
    static hasMany= [readingItems:ReadingItem, resourceRatings:ResourceRating]
    static constraints = {
    }
    static mapping={
        table 'LocalResource'
    }
}
