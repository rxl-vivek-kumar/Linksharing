package linkshare


class DashboardAccessController {
    def CreateTopicService
    def UserInboxService
    def index() { }
    def createTopic(){
        CreateTopicService.createTopic(params,session.currentUser)
        redirect(url:'/user')

//        else render "you have already created this topic before "

    }

    def userInbox(){
        def unread=UserInboxService.unReadResource(session.currentUser.userName)

    }

}
