package linkshare

import org.springframework.web.multipart.MultipartFile

class AccessController {
    def LoginUserService
    def RegisterUserService
    def index() {

    }

    def registerUser(){
        RegisterUserService.register(params)
        redirect(url:"/")
    }

    def loginUser(){
        flash.message="${LoginUserService.serviceMethod(params)}"
        if(!flash.message){
           session.currentUser=User.findByEmailOrUserName(params.loginEmail,params.loginEmail)
            redirect(controller:'User')
        }
        else redirect(url:'/', model:[message:flash.message])
    }

    def logoutUser(){
        session.invalidate()
        redirect(url:"/")
    }
}
