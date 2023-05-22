package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class ShowPostService {

    def serviceMethod(def resourceId) {
        def resource = Resource.get(resourceId)
        def result = ResourceRating.createCriteria().get {
            eq('resource', resource)
            projections {
                countDistinct('user')
                avg('score')
            }
        }
        def userCount = result[0]
        def averageRating = result[1]
        def postDetails=[resource:resource, userCount:userCount, avgRating:averageRating]
        return postDetails
    }
    def postRating(params,userId){
        def user=User.get(userId)
        Resource res=Resource.get(params.postId as Long)
        def score=params.rating as Long
        def resExist=ResourceRating.findByUserAndResource(user,res)
        if(resExist){

            resExist.score=score
        }else{
            resExist=new ResourceRating(user: user,resource: res,score: score)

        }
        if(resExist.save(flush:true,failOnError:true)){
            return true
        }else return false
    }
}
