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
            def topic = sub.topic
            def topicCount = Subscription.countByTopic(topic)
            def createdBy = topic.createdBy
            def topicCreatedByCount = Topic.countByCreatedBy(createdBy)
            def topicData = [topic: topic, topicCount: topicCount, createdBy: createdBy, topicCreatedByCount: topicCreatedByCount]
            topics << topicData
        }
        return topics
    }
}
