package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class AdminPageService {

    def serviceMethod() {

    }
    def users(){
        def users = User.list()
        return users
    }
    def topics(){
        def topics=Topic.list()
        return topics
    }
    def posts(){
        def posts=Resource.list()
        return posts
    }

}
