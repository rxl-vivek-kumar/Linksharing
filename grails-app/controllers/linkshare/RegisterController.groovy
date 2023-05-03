package linkshare

class RegisterController {

    def index() {
        render(view:'index')
    }
    def registerUser(){
        User u=new User()
        u.firstName=params.firstName
        u.lastName=params.lastName
        u.email=params.email
        u.userName=params.userName
        u.password=params.password
        u.save(flush:true, failOnError:true)
        redirect()
    }
}
