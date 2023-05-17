package linkshare

class ShareLinkController {
    def ShareLinkService


    def index() { }

    def shareLink() {
        User user = session.currentUser
        flash.error=ShareLinkService.serviceMethod(params,user)
        redirect url: request.getHeader("Referer")


    }
}
