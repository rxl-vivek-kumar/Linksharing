package linkshare
import linkshare.SeriousnessEnum
class Subscription {
    SeriousnessEnum seriousness;
    Date dateCreated;
    static belongsTo=[user:User,topic:Topic]
    static constraints = {
    }
}
