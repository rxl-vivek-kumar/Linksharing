package linkshare
import org.hibernate.criterion.Order;
import grails.gorm.transactions.Transactional

import org.grails.datastore.mapping.query.api.Criteria


class RecentSharesService {

   def serviceMethod() {

       def recentSharedResource = Resource.createCriteria().list {
           topic {
               eq('visibility', VisibilityEnum.Public)
           }
           order('dateCreated', 'desc')
           maxResults(5)
       }

//       def user=[]
//       for(Integer i=0;i<5;i++){
//           user.add(recentSharedResource[i].createdBy)
//       }
//       def photoUrls=[]
//       for(it in user){
//           String s=it.photo
//           photoUrls.add(s.substring(25))
//       }

//       println photoUrls
//       def photoUrls=[]
//       photoUrls = Resource.withCriteria {
//           inList('createdBy', recentSharedResource*.createdBy)
//           createdBy {
//               projections {
//                   property('photo')
//               }
//           }
//       }.list().collect { it[0] as String }
//       def recentShares=[[]]
//       recentShares.add(recentSharedResource)
//       recentShares.add(photoUrls)
       return recentSharedResource
   }
}
