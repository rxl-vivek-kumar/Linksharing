package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class UserTopicsAndSubscriptionsService {

    def serviceMethod() {

    }
    def totalTopicsAndSubscriptions(def u){
        Integer subscriptionCount=Subscription.countByUser(u)
        Integer topicCount=Topic.countByCreatedBy(u)
        def userDetails=[:]
        userDetails.put("subscriptions", subscriptionCount)
        userDetails.put("topics", topicCount)
        return userDetails
    }

}
