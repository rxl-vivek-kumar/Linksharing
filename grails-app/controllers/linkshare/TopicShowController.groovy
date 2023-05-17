package linkshare

class TopicShowController {
    def TopicShowService
    def index() {
        def topicId=params.topicId as Long
        def topicDetails=TopicShowService.topicDetails(topicId)
        def topicUser=TopicShowService.topicUser(topicId)
        def topicPost=TopicShowService.topicPost(topicId)

        render(view:'/user/topicShow', model:[topicDetails:topicDetails,topicUser:topicUser,topicPost:topicPost])
    }

}
