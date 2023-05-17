package linkshare

import grails.converters.JSON

class ShowPostController {
    def ShowPostService
    def TrendingTopicService


    def index() {
        def postDetails=ShowPostService.serviceMethod(params.resourceId as Long)
        def trendingTopic = TrendingTopicService.serviceMethod()
        render(view:'/user/showPost',model:[trendingTopic:trendingTopic,postDetails:postDetails])
    }


    def postRating(){
        User user=session.currentUser
        def message=ShowPostService.postRating(params,user)
        if(message){
            flash.message="Thank You for Rating"
            render([success:true] as JSON)
        }else{
            flash.error="Something Went Wrong. Try Again! "
            render([success:false] as JSON)
        }
    }
}
