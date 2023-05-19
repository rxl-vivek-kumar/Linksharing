package linkshare

class AccessController {
    def LoginUserService
    def RegisterUserService
    def index() {
    }

    def registerUser(){
        def message=RegisterUserService.register(params)
        if(message){
            flash.error=message
        }else flash.message="User registered Successfully!"
        redirect(url:"/")
    }

    def loginUser(){
        flash.error="${LoginUserService.serviceMethod(params)}"
        if(!flash.error){
           session.currentUser=User.findByEmailOrUserName(params.loginEmail,params.loginEmail)
            flash.message="Logged in Successfully"
            redirect(controller:'User')
        }
        else redirect(url:'/', model:[message:flash.error])
    }

    def logoutUser(){
        session.invalidate()
        redirect(url:"/")
    }


}
