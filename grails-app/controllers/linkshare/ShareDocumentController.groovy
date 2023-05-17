package linkshare

class ShareDocumentController {
    def ShareDocumentService
    def index() { }
    def fileUpload() {
        User user = session.currentUser
        flash.error=ShareDocumentService.serviceMethod(params,user)
        redirect url: request.getHeader("Referer")

    }
}
