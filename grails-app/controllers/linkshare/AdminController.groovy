package linkshare

import grails.converters.JSON

class AdminController {
    def AdminPageService
    def index() {
    }
    def userList(){
        if(session.currentUser){
            if(session.currentUser.isAdmin==true){
                def users=AdminPageService.users()
                render(view:'/user/allUsers',model:[users:users])
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
       def user = User.get(params.userId as Long)
       user.isActive = !user.isActive
       if(user.save(flush: true,failOnError:true)) {
           render([success: true] as JSON)
       }else{
           render([success:false] as JSON)
       }
   }

    def topicList(){
        if(session.currentUser){
            if(session.currentUser.isAdmin==true){
                def topics=AdminPageService.topics()
                render(view:'/user/allTopics',model:[topics:topics])
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
        if(session.currentUser){
            if(session.currentUser.isAdmin==true){
                def posts=AdminPageService.posts()
                render(view:'/user/allPosts',model:[posts:posts])
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
