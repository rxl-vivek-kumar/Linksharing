package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class ReadItemService {

    def serviceMethod(user,resource) {
        def readItem=ReadingItem.findByUserAndResource(user,resource)
        readItem.isRead=true
        if(readItem.save(flush:true,failOnError:true)){
            return true
        }else{
            return false
        }
    }
}
