package linkshare
import org.hibernate.criterion.Order;
import grails.gorm.transactions.Transactional

import org.grails.datastore.mapping.query.api.Criteria

@Transactional
class RecentPostService {

   def serviceMethod() {

       List<Resource> recentPost = Resource.createCriteria().list {
           topic {
               eq('visibility', VisibilityEnum.Public)
           }
           order('dateCreated', 'desc')
           maxResults(5)
       }
   }
}
