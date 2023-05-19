package linkshare

class ShareDocumentController {
    def ShareDocumentService
    def index() { }
    def fileUpload() {
        if(!session.currentUser){redirect(url:'/User')}
        User user = session.currentUser
        flash.error=ShareDocumentService.serviceMethod(params,user)
        redirect url: request.getHeader("Referer")

    }
}
