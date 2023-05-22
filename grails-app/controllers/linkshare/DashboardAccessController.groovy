package linkshare

import grails.converters.JSON
import org.springframework.mail.MailSender
import org.springframework.mail.SimpleMailMessage


class DashboardAccessController {
    MailSender mailSender
    def CreateTopicService
    def SearchService
    def TrendingTopicService
    def TopPostsService
    def UserTopicsAndSubscriptionsService

    def index() { }
    def createTopic(){
        if(!session.currentUser){redirect(url:'/User')}
        flash.error=CreateTopicService.createTopic(params,session.currentUser)
        redirect(url:'/user')
    }

    def sendInvitation(){
        if(!session.currentUser){redirect(url:'/User')}
        def receiverEmail = params.inviteEmail
        def topicId = params.inviteToTopic as Long
        def topicName=Topic.get(topicId)?.name
        def url="http://localhost:9090/TopicShow/index?topicId=${topicId}"

        def mssg=new SimpleMailMessage()
        mssg.setFrom('testingExample474747@outlook.com')
        mssg.setTo("${receiverEmail}")
        mssg.setSubject("Invitation for Topic-${topicName}")
        mssg.setText("Click this link below to go to the Topic page: <a href='${url}'>${url}</a>")
        mailSender.send(mssg)
        redirect url: request.getHeader("Referer")
    }

    def sendOTP(){
        def receiverEmail = params.email
        if(!User.findByEmail(receiverEmail)){
            render([success: false] as JSON)
        }else{
            def num=Math.abs( new Random().nextInt() % (9999 - 100) ) + 100
            def mssg=new SimpleMailMessage()
            mssg.setFrom('testingExample474747@outlook.com')
            mssg.setTo("${receiverEmail}")
            mssg.setSubject("OTP to reset your Password")
            mssg.setText("${num}")
            mailSender.send(mssg)
            render([success:true] as JSON)
        }
    }

    def searchTopic(){
        if(session.currentUser){
            def userTopicsAndSubscriptionsDetails = UserTopicsAndSubscriptionsService.totalTopicsAndSubscriptions(session.currentUser)
            def trendingTopic = TrendingTopicService.serviceMethod()
            def topPosts=TopPostsService.serviceMethod()
            def result=SearchService.searchData(params,session.currentUser)
            render(view:'/user/searchPage',model:[userDetails:userTopicsAndSubscriptionsDetails, result:result,trendingTopic:trendingTopic,topPosts:topPosts])
        }else{
            def trendingTopic = TrendingTopicService.serviceMethod()
            def topPosts=TopPostsService.serviceMethod()
            def result=SearchService.searchData(params,session.currentUser)
            render(view:'/user/searchPage',model:[result:result,trendingTopic:trendingTopic,topPosts:topPosts])
        }
    }
}
