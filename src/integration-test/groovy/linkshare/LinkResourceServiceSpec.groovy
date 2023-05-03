package linkshare

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class LinkResourceServiceSpec extends Specification {

    LinkResourceService linkResourceService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new LinkResource(...).save(flush: true, failOnError: true)
        //new LinkResource(...).save(flush: true, failOnError: true)
        //LinkResource linkResource = new LinkResource(...).save(flush: true, failOnError: true)
        //new LinkResource(...).save(flush: true, failOnError: true)
        //new LinkResource(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //linkResource.id
    }

    void "test get"() {
        setupData()

        expect:
        linkResourceService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<LinkResource> linkResourceList = linkResourceService.list(max: 2, offset: 2)

        then:
        linkResourceList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        linkResourceService.count() == 5
    }

    void "test delete"() {
        Long linkResourceId = setupData()

        expect:
        linkResourceService.count() == 5

        when:
        linkResourceService.delete(linkResourceId)
        sessionFactory.currentSession.flush()

        then:
        linkResourceService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        LinkResource linkResource = new LinkResource()
        linkResourceService.save(linkResource)

        then:
        linkResource.id != null
    }
}
