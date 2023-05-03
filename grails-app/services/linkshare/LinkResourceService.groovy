package linkshare

import grails.gorm.services.Service

@Service(LinkResource)
interface LinkResourceService {

    LinkResource get(Serializable id)

    List<LinkResource> list(Map args)

    Long count()

    void delete(Serializable id)

    LinkResource save(LinkResource linkResource)

}