package linkshare


class User {
    String email;
    String userName;
    String password;
    String firstName;
    String lastName;
    byte[] photo;
    Date dateCreated;
    Date lastUpdated;

    static hasMany=[topics:Topic,resourceRatings:ResourceRating,resources:Resource,
                    subscriptions: Subscription,readingItems:ReadingItem]

    static constraints = {
        email unique:true
        userName unique:true
        password  blank:false
        firstName nullable:false
        lastName nullable:true
        photo nullable:true
    }
    static mapping = {
        table 'LocalUser'
    }
}