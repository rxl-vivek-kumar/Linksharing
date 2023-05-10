package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class CreateTopicService {

    def serviceMethod() {

    }
    def createTopic(def params,User user){
        Topic createdTopic=new Topic()
        createdTopic.name=params.name
        createdTopic.visibility=params.visibility
        createdTopic.createdBy=user
        Topic existUserTopic=Topic.findByNameAndCreatedBy(createdTopic.name,user)
        if(!existUserTopic){
            createdTopic.createdBy=user
            createdTopic.save(flush:true,failOnError:true)
            Subscription subscribe=new Subscription()
            subscribe.user=user
            subscribe.topic=createdTopic
            subscribe.seriousness= SeriousnessEnum.VERY_SERIOUS
            subscribe.save(flush:true,failOnError:true)
        }
    }
}
