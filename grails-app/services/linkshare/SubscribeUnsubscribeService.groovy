package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class SubscribeUnsubscribeService {

    def serviceMethod() {

    }
    def subscribe(topicId,userId,seriousness){
        def topic=Topic.get(topicId)
        def user=User.get(userId)
        Subscription subs=new Subscription(topic:topic,user:user,seriousness:seriousness )
        if(subs?.save(flush:true,flushOnError:true)){
            return true
        }else {
            return false
        }

    }

    def unsubscribe(topicId,userId){
        def topic=Topic.get(topicId)
        def user=User.get(userId)
        if(topic?.createdBy.id==user?.id){
            return false
        }
        Subscription subs=Subscription.findByTopicAndUser(topic,user)
        if(subs){
            subs.delete(flush:true,flushOnError:true)
            return true
        }else {
            return false
        }

    }
}
