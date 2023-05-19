package linkshare

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional
class ShareDocumentService {

    def serviceMethod(params,user) {
        Topic topic = Topic.get(params.documentTopic as Long)
        Resource r = new DocumentResource(description: params.documentDescription,
                createdBy: user, topic: topic)
        def multipartFile=params.document
        def originalFile=multipartFile.getOriginalFilename()
        def bytes=multipartFile.getBytes()
        def url="src/main/resources/public/documents/${originalFile}"
        def dbpath="/static/documents/${originalFile}"
        def newFile=new File("${url}")
        newFile.createNewFile()
        newFile.append(bytes)
        r.filePath=dbpath
        r.validate()
        if (r.hasErrors()) {
            return "Please try again"
        }
        else {
            r.save(flush: true,failOnError:true)
            def subscriber=Subscription.findAllByTopic(r.topic).user
            subscriber.each {it->
                    def read=new ReadingItem(user: it,resource: r)
                    read.save(flush:true,failOnError:true)
            }
            return ""
        }
    }
}
