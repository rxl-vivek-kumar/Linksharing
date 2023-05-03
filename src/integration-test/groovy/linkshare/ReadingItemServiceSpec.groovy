package linkshare

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ReadingItemServiceSpec extends Specification {

    ReadingItemService readingItemService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new ReadingItem(...).save(flush: true, failOnError: true)
        //new ReadingItem(...).save(flush: true, failOnError: true)
        //ReadingItem readingItem = new ReadingItem(...).save(flush: true, failOnError: true)
        //new ReadingItem(...).save(flush: true, failOnError: true)
        //new ReadingItem(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //readingItem.id
    }

    void "test get"() {
        setupData()

        expect:
        readingItemService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<ReadingItem> readingItemList = readingItemService.list(max: 2, offset: 2)

        then:
        readingItemList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        readingItemService.count() == 5
    }

    void "test delete"() {
        Long readingItemId = setupData()

        expect:
        readingItemService.count() == 5

        when:
        readingItemService.delete(readingItemId)
        sessionFactory.currentSession.flush()

        then:
        readingItemService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        ReadingItem readingItem = new ReadingItem()
        readingItemService.save(readingItem)

        then:
        readingItem.id != null
    }
}
