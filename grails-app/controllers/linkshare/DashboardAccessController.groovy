package linkshare


class DashboardAccessController {

    def index() { }
    def createTopic(){

        Topic createdTopic=new Topic()
        createdTopic.name=params.name
        createdTopic.visibility=params.visibility
        createdTopic.createdBy=session.currentUser
        Topic existUserTopic=Topic.findByNameAndCreatedBy(createdTopic.name,session.currentUser)
        if(!existUserTopic){
            createdTopic.createdBy=session.currentUser
            createdTopic.save(flush:true,failOnError:true)
            Subscription subscribe=new Subscription()
            subscribe.user=session.currentUser
            subscribe.topic=createdTopic
            subscribe.seriousness= SeriousnessEnum.VERY_SERIOUS
            subscribe.save(flush:true,failOnError:true)
        }
        redirect(url:'/user')

//        else render "you have already created this topic before "

    }
}
