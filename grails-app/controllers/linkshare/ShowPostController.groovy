package linkshare

import grails.converters.JSON

class ShowPostController {
    def ShowPostService
    def TrendingTopicService
    def UserTopicsAndSubscriptionsService


    def index() {
        if(!session.currentUser){redirect(url:'/User')}
        def userTopicsAndSubscriptionsDetails = UserTopicsAndSubscriptionsService.totalTopicsAndSubscriptions(session.currentUser)
        def postDetails=ShowPostService.serviceMethod(params.resourceId as Long)
        def trendingTopic = TrendingTopicService.serviceMethod()
        render(view:'/user/showPost',model:[userDetails: userTopicsAndSubscriptionsDetails,trendingTopic:trendingTopic,postDetails:postDetails])
    }
    def showPost1(){
        def postDetails=ShowPostService.serviceMethod(params.resourceId as Long)
        def trendingTopic = TrendingTopicService.serviceMethod()
        render(view:'/user/showPost',model:[trendingTopic:trendingTopic,postDetails:postDetails])
    }

    def postRating(){
        if(!session.currentUser){redirect(url:'/User')}
        def userId=session.currentUser.id
        def message=ShowPostService.postRating(params,userId)
        if(message){
            flash.message="Thank You for Rating"
            render([success:true] as JSON)
        }else{
            flash.error="Something Went Wrong. Try Again! "
            render([success:false] as JSON)
        }
    }
}
