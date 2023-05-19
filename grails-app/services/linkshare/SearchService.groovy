package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class SearchService {

    def serviceMethod() {
    }
    def searchData(Map params,user){
        if(!user){
            if(params.query==''){
                return Topic.list()
            }
            else{
                return Resource.createCriteria().list{
                    createAlias('topic','t')
                    or{
                        ilike('t.name', "%${params.query}%")
                        ilike("description", "%${params.query}%")
                    }
                }
            }
        }
       else{
            if(user?.isAdmin){
                if(params.query==''){
                    return Topic.list()
                }
                else{
                    return Resource.createCriteria().list{
                        createAlias('topic','t')
                        or{
                            ilike('t.name', "%${params.query}%")
                            ilike("description", "%${params.query}%")
                        }
                    }
                }
            }
            else{
                if (params?.query != '') {
                    return Resource.createCriteria().list {
                        createAlias('topic', 't')
                        or {
                            eq 't.visibility', linksharing.Visibility.PUBLIC
                            eq 't.createdBy', user
                        }
                        or {
                            ilike("t.name", "%${params.query}%")
                            ilike("description", "%${params.query}%")
                        }
                    }
                }
                else{
                    return null
                }
            }
        }
    }
}
