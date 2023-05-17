package linkshare

import grails.converters.JSON

class ForgotPasswordController {

    def index() {
    }
    def resetPassword(){
            def email = params.email
            def password = params.password
            def user = User.findByEmail(email)
        println user.userName
            if (!user) {
                render([success: false] as JSON)
                return
            }
            user.password = password
            if (!user.save(flush: true)) {
                render([success: false] as JSON)
                return
            }
            render([success: true] as JSON)
    }
}
