package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class UserTopicsAndSubscriptionsService {

    def serviceMethod() {

    }
    def totalTopicsAndSubscriptions(User u){
        Integer subscriptionCount=Subscription.countByUser(u)
        Integer topicCount=Topic.countByCreatedBy(u)
        def subscribedTopics = Subscription.findAllByUser(u)*.topic.name
        def userDetails=[:]
        userDetails.put("subscriptionCount", subscriptionCount)
        userDetails.put("topicCount", topicCount)
        userDetails.put("subscribedTopics", subscribedTopics)
        return userDetails
    }

}
