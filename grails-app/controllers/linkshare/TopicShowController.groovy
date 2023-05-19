package linkshare

class TopicShowController {
    def TopicShowService
    def UserTopicsAndSubscriptionsService
    def index() {
        if(!session.currentUser){redirect(url:'/User')}
        def topicId=params.topicId as Long
        def userTopicsAndSubscriptionsDetails = UserTopicsAndSubscriptionsService.totalTopicsAndSubscriptions(session.currentUser)
        def topicDetails=TopicShowService.topicDetails(topicId)
        def topicUser=TopicShowService.topicUser(topicId)
        def topicPost=TopicShowService.topicPost(topicId)
        render(view:'/user/topicShow', model:[userDetails:userTopicsAndSubscriptionsDetails,topicDetails:topicDetails,topicUser:topicUser,topicPost:topicPost])
    }

    def topicShow1(){
        def topicId=params.topicId as Long
        def topicDetails=TopicShowService.topicDetails(topicId)
        def topicUser=TopicShowService.topicUser(topicId)
        def topicPost=TopicShowService.topicPost(topicId)
        render(view:'/user/topicShow', model:[topicDetails:topicDetails,topicUser:topicUser,topicPost:topicPost])
    }

}
