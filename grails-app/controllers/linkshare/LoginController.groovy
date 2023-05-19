package linkshare

class LoginController {

    def index() {

    }
    def loginUser(){

        String userEmail=params.loginEmail
        String userPassword=params.loginPassword
        User u = User.findByEmailOrUserName(userEmail,userEmail);
        if(!u){
            render "user dont' exist"
        }
        else if(u.password==userPassword){
            redirect(url:"/user/index")
        }
        else{
            render "wrong password"
        }
        //  redirect(url:"/")
    }
}
