package linkshare

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class LoggedInInterceptorSpec extends Specification implements InterceptorUnitTest<LoggedInInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test loggedIn interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"loggedIn")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
