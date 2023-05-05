package linkshare

class AccessController {
    def LoginUserService
    def RecentPostService
    def index() {

    }
    def recentPosts()
    {
        List<Resource> recentPost=RecentPostService.serviceMethod()
        render recentPost
    }

    def registerUser(){
        User u=new User()
        u.firstName=params.firstName
        u.lastName=params.lastName
        u.email=params.registerEmail
        u.userName=params.registerUserName
        u.password=params.registerPassword
        u.validate()
        if(u.hasErrors()){
            u.errors.allErrors.each{
                println it
            }
        }
        else  {
            u.save(flush:true,failOnError:true)
            redirect(url:"/")
        }
//        if(params.registerPassword==params.confirmPassword){
//            u.save(flush:true, failOnError:true)
//        }

    }

    def loginUser(){
        flash.message="${LoginUserService.serviceMethod(params)}"
        if(!flash.message){
            session.currentUser=User.findByEmailOrUserName(params.loginEmail,params.loginEmail)
            def userDetails=[:]
            userDetails.put("subscriptions", UserDetailsService.totalSubscriptions(session.currentUser))
            userDetails.put("topics", UserDetailsService.totalTopics(session.currentUser))
            redirect(url:"/User",model:[userDetails:'userDetails'])
        }
        else redirect(url:'/', model:[message:flash.message])
    }
    def logoutUser(){
        session.invalidate()
        redirect(url:"/")
    }
}
