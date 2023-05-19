package linkshare

import grails.converters.JSON

class EditSubscribedTopicController {
    def index() {
        if(!session.currentUser){redirect(url:'/User')}
            def topic = Topic.get(params.id)
            if (topic) {
                topic.name = params.name
                if (topic.save(flush:true,failOnError:true)) {
                    render([success: true] as JSON)
                } else {
                    render([success: false] as JSON)
                }
            } else {
                render([success: false] as JSON)
            }
    }
    def deleteTopic(){
        if(!session.currentUser){redirect(url:'/User')}
        def topic = Topic.get(params.topicId as Long)
        if (topic) {
                topic.delete(flush: true, failOnError: true)
                render ([success:true] as JSON)
        } else {
            render([success:false] as JSON)
        }
    }

   def editVisibility(){
       if(!session.currentUser){redirect(url:'/User')}
       def topic=Topic.get(params.topicId as long)
       if(topic){
           topic.visibility=params.visibility
           topic.save(flush:true,failOnError:true)
           render([topic.visibility] as JSON )
       } else{
           render([success:false] as JSON)
       }
   }
    def editSeriousness(){
        if(!session.currentUser){redirect(url:'/User')}
        def subscription=Subscription.get(params.subscriptionId as long)
        if(subscription){
            subscription.seriousness=params.seriousness
            subscription.save(flush:true,failOnError:true)
            render([subscription.seriousness] as JSON )
        } else{
            render([success:false] as JSON)
        }

    }
    def editTopicSeriousness(){
        if(!session.currentUser){redirect(url:'/User')}
        def topic=Topic.get(params.topicId as Long)
        def user=User.get(params.userId as Long)
        def subscription=Subscription.findByTopicAndUser(topic,user)
        if(subscription){
            subscription.seriousness=params.seriousness
            subscription.save(flush:true,failOnError:true)
            render([subscription.seriousness] as JSON )
        } else{
            render([success:false] as JSON)
        }

    }
}

