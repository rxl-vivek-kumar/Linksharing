package linkshare

import Enum.SeriousnessEnum

class Subscription {
    Topic topic;
    User user;
    SeriousnessEnum seriousness;
    Date dateCreated;
    static belongsTo=[users:User,topics:Topic]
    static constraints = {
    }
    static mapping={
        table 'Subscription'
    }
}
