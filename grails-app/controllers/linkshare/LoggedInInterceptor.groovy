package linkshare


class LoggedInInterceptor {
    LoggedInInterceptor(){
   }
    boolean before() {
        if (!session.currentUser) {
            flash.warn="Please Login to Continue"
            redirect(controller:'User')
            return false
        }
        return true
   }
}
