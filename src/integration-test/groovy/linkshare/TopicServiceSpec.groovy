package linkshare

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class TopicServiceSpec extends Specification {

    TopicService topicService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Topic(...).save(flush: true, failOnError: true)
        //new Topic(...).save(flush: true, failOnError: true)
        //Topic topic = new Topic(...).save(flush: true, failOnError: true)
        //new Topic(...).save(flush: true, failOnError: true)
        //new Topic(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //topic.id
    }

    void "test get"() {
        setupData()

        expect:
        topicService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Topic> topicList = topicService.list(max: 2, offset: 2)

        then:
        topicList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        topicService.count() == 5
    }

    void "test delete"() {
        Long topicId = setupData()

        expect:
        topicService.count() == 5

        when:
        topicService.delete(topicId)
        sessionFactory.currentSession.flush()

        then:
        topicService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Topic topic = new Topic()
        topicService.save(topic)

        then:
        topic.id != null
    }
}
