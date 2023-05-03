package linkshare

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class DocumentResourceServiceSpec extends Specification {

    DocumentResourceService documentResourceService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new DocumentResource(...).save(flush: true, failOnError: true)
        //new DocumentResource(...).save(flush: true, failOnError: true)
        //DocumentResource documentResource = new DocumentResource(...).save(flush: true, failOnError: true)
        //new DocumentResource(...).save(flush: true, failOnError: true)
        //new DocumentResource(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //documentResource.id
    }

    void "test get"() {
        setupData()

        expect:
        documentResourceService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<DocumentResource> documentResourceList = documentResourceService.list(max: 2, offset: 2)

        then:
        documentResourceList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        documentResourceService.count() == 5
    }

    void "test delete"() {
        Long documentResourceId = setupData()

        expect:
        documentResourceService.count() == 5

        when:
        documentResourceService.delete(documentResourceId)
        sessionFactory.currentSession.flush()

        then:
        documentResourceService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        DocumentResource documentResource = new DocumentResource()
        documentResourceService.save(documentResource)

        then:
        documentResource.id != null
    }
}
