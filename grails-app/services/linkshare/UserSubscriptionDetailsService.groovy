package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class UserSubscriptionDetailsService {

    def serviceMethod() {
    }
    def subscriptions(User u){
        def user = User.get(u.id)
        def subscriptions = Subscription.findAllByUser(user)
        def topics = []
        subscriptions.each { sub ->
            def subscription=sub
            def topic = sub.topic
            def topicCount = Subscription.countByTopic(topic)
            def createdBy = topic.createdBy
            def topicResourceCount = Resource.countByTopic(topic)
            def topicData = [topic: topic, topicCount: topicCount, createdBy: createdBy, topicResourceCount: topicResourceCount,subscription:subscription]
            topics << topicData
        }
        return topics
    }
}
