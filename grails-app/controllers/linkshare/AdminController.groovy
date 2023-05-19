package linkshare

import grails.converters.JSON


class AdminController {
    def AdminPageService
    def UserTopicsAndSubscriptionsService
    def index() {
    }
    def userList(){
        if(!session.currentUser){redirect(url:'/User')}
        def userTopicsAndSubscriptionsDetails = UserTopicsAndSubscriptionsService.totalTopicsAndSubscriptions(session.currentUser)
        if(session.currentUser){
            if(session.currentUser.isAdmin==true){
                def users=AdminPageService.users()
                render(view:'/user/allUsers',model:[userDetails:userTopicsAndSubscriptionsDetails,users:users])
            }
            else{
                flash.message="Only Admins Are Allowed"
                render(controller:'User')
            }
        }else{
            render(controller:'User')
        }
    }
   def editUserStance(){
       if(!session.currentUser){redirect(url:'/User')}
       def user = User.get(params.userId as Long)
       user.isActive = !user.isActive
       if(user.save(flush: true,failOnError:true)) {
           render([success: true] as JSON)
       }else{
           render([success:false] as JSON)
       }
   }

    def topicList(){
        if(!session.currentUser){redirect(url:'/User')}
        def userTopicsAndSubscriptionsDetails = UserTopicsAndSubscriptionsService.totalTopicsAndSubscriptions(session.currentUser)
        if(session.currentUser){
            if(session.currentUser.isAdmin==true){
                def topics=AdminPageService.topics()
                render(view:'/user/allTopics',model:[userDetails:userTopicsAndSubscriptionsDetails,topics:topics])
            }
            else{
                flash.message="Only Admins Are Allowed"
                render(controller:'User')
            }
        }else{
            render(controller:'User')
        }
    }

    def deleteTopic(){
        if(!session.currentUser){redirect(url:'/User')}
        def topic=Topic.get(params.topicId as Long)
        topic.delete(flush:true,failOnError:true)
        def deletedTopic=Topic.get(params.topicId as Long)
        if(!deletedTopic) {
            render([success: true] as JSON)
        }else{
            render([success:false] as JSON)
        }
    }

    def postList(){
        if(!session.currentUser){redirect(url:'/User')}
        def userTopicsAndSubscriptionsDetails = UserTopicsAndSubscriptionsService.totalTopicsAndSubscriptions(session.currentUser)
        if(session.currentUser){
            if(session.currentUser.isAdmin==true){
                def posts=AdminPageService.posts()
                render(view:'/user/allPosts',model:[userDetails:userTopicsAndSubscriptionsDetails, posts:posts])
            }
            else{
                flash.message="Only Admins Are Allowed"
                render(controller:'User')
            }
        }else{
            render(controller:'User')
        }
    }
    def deletePost(){
        if(!session.currentUser){redirect(url:'/User')}
        def post=Resource.get(params.postId as Long)
        post.delete(flush:true,failOnError:true)
        def deletedPost=Resource.get(params.postId as Long)
        if(!deletedPost) {
            render([success: true] as JSON)
        }else{
            render([success:false] as JSON)
        }
    }

}
