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
    }
}
