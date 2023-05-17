package linkshare

import grails.converters.JSON
def

class ReadingItemController {
    def ReadItemService
    def index(Integer max) {
    }
    def markAsRead(){
        def resource=Resource.findById(params.resourceId as Long)
        def user=session.currentUser
        if(ReadItemService.serviceMethod(user,resource)){
            render([success:true] as JSON)
        }else{
            render([success:false] as JSON)
        }
    }
}
