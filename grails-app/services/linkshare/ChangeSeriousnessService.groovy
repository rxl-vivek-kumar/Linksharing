package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class ChangeSeriousnessService {

    def serviceMethod() {
        def user=User.findById(params.userId as Long)
        def topic=Topic.findById(params.topicId as Long)
        def subs=Subscription.findByUserAndTopic(user,topic)
        subs.seriousness=params.seriousness
        if(subs.save(flush:true,failOnError:true)){
            return true
        }else{
            return false
        }
    }
}
