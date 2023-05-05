package linkshare

class UserController {
//use interceptor here to avoid direct access to dashboard.
    def index() {
        if(session.currentUser){
            render(view:'dashboard')
        }
        else{
            redirect(url:'/')
        }
    }

}
