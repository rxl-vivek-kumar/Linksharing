package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class TopicShowService {

    def serviceMethod() {

    }

    def topicDetails(topicId) {
        Topic topic = Topic.get(topicId)
        List result = Topic.createCriteria().list() {
            eq('id', topic.id)
            projections {
                groupProperty('id')
                groupProperty('name')
                countDistinct('subscription')
                countDistinct('resource')
            }
        }

        Map topicDetails = [:]
        if (!result.empty) {
            Object[] row = result[0]
            Topic top=Topic.findById(row[0])
            topicDetails = [topic: top, subscriptionCount: row[2], postCount: row[3]]
        }

        return topicDetails
    }

    def topicUser(topicId) {
        def topic = Topic.get(topicId)
        def users = User.createCriteria().listDistinct {
            createAlias("subscription", "s")
            eq("s.topic", topic)
        }
        def topicUser = []
        users.each { u ->
            def user = u
            Integer subscriptionCount = Subscription.countByUser(u)
            Integer topicCount = Topic.countByCreatedBy(u)
            def subscribedTopics = Subscription.findAllByUser(u)*.topic.name
            def userDetails = [:]
            userDetails.put("user", user)
            userDetails.put("subscriptionCount", subscriptionCount)
            userDetails.put("topicCount", topicCount)
            userDetails.put("subscribedTopics", subscribedTopics)
            topicUser << userDetails
        }
        return topicUser
    }

    def topicPost(topicId) {

            Topic topic = Topic.findById(topicId)
            List<Resource> topicResources = Resource.findAllByTopic(topic)
            return topicResources
    }
}