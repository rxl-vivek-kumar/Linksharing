package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class UserTopicsService {

    def serviceMethod() {

    }
    def topics(User u){
        def user = User.get(u.id)
        def topics = []
        List<Object[]> result = Topic.createCriteria().list() {
            eq('createdBy', user)
            projections {
                groupProperty('id')
                groupProperty('name')
                groupProperty('createdBy')
                countDistinct('subscription')
                countDistinct('resource')
            }
        }
        result.each { top ->
            def topic = Topic.get(top[0])
            def subscriptionCount = top[3]
            def createdBy = topic.createdBy
            def resourceCount = top[4]
            def subscription=Subscription.findByTopicAndUser(topic,createdBy)
            def topicData = [topic: topic, subscriptionCount: subscriptionCount, createdBy: createdBy, resourceCount: resourceCount,subscription:subscription]
            topics << topicData
        }
        return topics
    }
}
