package linkshare

import grails.gorm.services.Service

@Service(DocumentResource)
interface DocumentResourceService {

    DocumentResource get(Serializable id)

    List<DocumentResource> list(Map args)

    Long count()

    void delete(Serializable id)

    DocumentResource save(DocumentResource documentResource)

}