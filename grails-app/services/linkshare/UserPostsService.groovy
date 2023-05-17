package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class UserPostsService {

    def serviceMethod(user) {
        def resources = Resource.createCriteria().list() {
            eq('createdBy', user)
            order('dateCreated', 'desc')
        }
        return resources
    }
}
