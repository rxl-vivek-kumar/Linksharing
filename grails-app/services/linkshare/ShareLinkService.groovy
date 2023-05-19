package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class ShareLinkService {

    def serviceMethod(params,user) {
        Topic topic = Topic.get(params.shareLinkTopic)
        Resource r = new LinkResource(description:params.shareLinkDescription, createdBy: user, topic: topic,
                url: params.shareLinkUrl)
        r.validate()
        if(r.hasErrors())
        {
            return "PLease enter correct url"
        }
        else
        {
            r.save(flush:true,failOnError:true)
            def subscriber=Subscription.findAllByTopic(r.topic).user
            subscriber.each {it->
                    def read=new ReadingItem(user: it,resource: r)
                    read.save(flush:true,failOnError:true)
            }
            return ""
        }
    }
}
