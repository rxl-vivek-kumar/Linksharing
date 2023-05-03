package linkshare

import grails.gorm.services.Service

@Service(ReadingItem)
interface ReadingItemService {

    ReadingItem get(Serializable id)

    List<ReadingItem> list(Map args)

    Long count()

    void delete(Serializable id)

    ReadingItem save(ReadingItem readingItem)

}