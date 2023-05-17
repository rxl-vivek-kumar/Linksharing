package linkshare

class RecentSharesService {

   def serviceMethod() {

       def recentSharedResource = Resource.createCriteria().list {
           topic {
               eq('visibility', VisibilityEnum.Public)
           }
           order('dateCreated', 'desc')
           maxResults(5)
       }


       return recentSharedResource
   }
}
