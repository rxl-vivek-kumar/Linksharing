package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class UserInboxService {

    def serviceMethod() {

    }
    def unReadResource(String activeUsername) {

        User user = User.findByUserName(activeUsername)
        def unReadPost=ReadingItem.createCriteria().list(){
            eq('user',user)
            eq('isRead',false)
        }*.resource
        return unReadPost
//        List read = ReadingItem.createCriteria().list() {
//            eq('isRead', true)
//            eq('user', activeUser)
//        }.resource.id
//
//        List sub = Subscription.findAllByUser(activeUser).topic.resource.id
//        List listSub = []
//        listSub = sub.flatten()
//
//        List unRead = []
//        if ((listSub - read).size() == 0) {
//            return unRead
//        } else {
//            unRead = Resource?.createCriteria().list() {
//                inList("id", (listSub - read))
//                order("lastUpdated", "desc")
//            }
//            return unRead
//        }

    }

//    def markAsRead(activeUsername, resourceId) {
//        User activeUser = User.findByUserName(activeUsername)
//        Resource res = Resource.get(resourceId)
//        ReadingItem hasRead = new ReadingItem(isRead: true, user: activeUser, resource: res)
//        hasRead.validate()
//        if (hasRead.hasErrors())
//        {
//            return false
//        }
//        else
//        {
//            hasRead.save(flush: true)
//            return true
//        }
//    }
}
