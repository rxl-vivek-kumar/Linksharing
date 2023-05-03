package linkshare

class RegisterController {

    def index() {

    }
    def registerUser(){
        User u=new User()
        u.firstName=params.firstName
        u.lastName=params.lastName
        u.email=params.registerEmail
        u.userName=params.registerUserName
        u.password=params.registerPassword
       //
       if(params.registerPassword==params.confirmPassword){
           u.save(flush:true, failOnError:true)
        }
        //else { u.save(flush:true, failOnError:true)}
        redirect(url:"/")
    }
}
