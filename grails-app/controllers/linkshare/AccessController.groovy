package linkshare

class AccessController {

    def index() {

    }

    def registerUser(){
        User u=new User()
        u.firstName=params.firstName
        u.lastName=params.lastName
        u.email=params.registerEmail
        u.userName=params.registerUserName
        u.password=params.registerPassword
        if(params.registerPassword==params.confirmPassword){
            u.save(flush:true, failOnError:true)
        }
        redirect(url:"/")
    }

    def loginUser(){


        String userEmail=params.loginEmail
        String userPassword=params.loginPassword
        User u = User.findByEmailOrUserName(userEmail,userEmail);

        session.USER_ID = u.id

        if(!u){
            render "user dont' exist"
        }
        else if(u.password==userPassword){
            redirect(url:"/user")
        }
        else{
            render "wrong password"
        }

    }
    def logoutUser(){
        session.invalidate()
        redirect(url:"/")
    }
}
