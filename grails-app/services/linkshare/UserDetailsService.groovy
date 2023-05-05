package linkshare


class UserDetailsService {

    def serviceMethod() {
    }

    def totalSubscriptions(User u){
        Integer subscriptionCount=Subscription.countByUser("${u}" as User)
        return subscriptionCount
    }

    def totalTopics(User u){
        Integer topicCount=Topic.countByCreatedBy("${u.userNmae}" as User)
        return topicCount
    }
}
