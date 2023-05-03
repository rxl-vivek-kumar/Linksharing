package linkshare

class Subscription {
    Topic topic;
    User user;
    Date dateCreated;
    static belongsTo=[users:User,topics:Topic]
    static constraints = {
    }
    static mapping={
        table 'Subscription'
    }
}
