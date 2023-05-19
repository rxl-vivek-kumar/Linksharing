package linkshare

import grails.converters.JSON

class SubscriptionController {
    def SubscribeUnsubscribeService

    def index(Integer max) {

    }

    def subscribeTopic(){
        if(!session.currentUser){redirect(url:'/User')}
        def topicId=params.topicId as Long
        def userId=params.userId as Long
        def seriousness=params.seriousness
        if(SubscribeUnsubscribeService.subscribe(topicId,userId,seriousness))
        {
            render([success:true] as JSON)
        }else{
            render([success:false] as JSON)
        }
    }

    def unsubscribeTopic(){
        if(!session.currentUser){redirect(url:'/User')}
        def topicId=params.topicId as Long
        def userId=params.userId as Long
        if(SubscribeUnsubscribeService.unsubscribe(topicId,userId)){
            render([success:true] as JSON)
        }else{
            render([success:false] as JSON)
        }
    }
}
