package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class TrendingTopicService {

    def serviceMethod() {
        def topics = Topic.createCriteria().list {
            createAlias('resource', 'r')
            createAlias('subscription', 's')

            projections {
                groupProperty('id')
                countDistinct('r.id', 'resourceCount')
                countDistinct('s.id', 'subscriptionCount')
            }

            order('resourceCount', 'desc')
            maxResults(5)
        }
        def trendingTopics=[]
        topics.each{top->
            def topic=Topic.get(top[0])
            def resourceCount=top[1]
            def subsCount=top[2]
            def eachTopicDetail=[topic:topic,postCount:resourceCount,subscriptionCount:subsCount]
            trendingTopics.add(eachTopicDetail)
        }
        return trendingTopics
    }
}
