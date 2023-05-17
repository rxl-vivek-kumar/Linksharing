package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class TopPostsService {

    def serviceMethod() {
        def top5ResourceRatings = ResourceRating.createCriteria().list(maxResults: 5) {
            projections {
                groupProperty('resource')
                avg('score','avg_score')
            }
            order('avg_score', 'desc')
        }
        def topPost=[]
        top5ResourceRatings.each { res ->
            Resource resource = res[0]
            def averageScore = res[1]
            def resourceMap=[resource:resource,avgScore:averageScore]
            topPost<<resourceMap
        }
        return topPost
    }
}
