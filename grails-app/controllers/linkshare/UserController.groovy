package linkshare

class UserController {
    def UserTopicsAndSubscriptionsService
    def RecentSharesService
    def UserSubscriptionDetailsService
    def TrendingTopicService
    def UserTopicsService
    def UserPostsService
    def UserInboxService
    def UpdateUserProfileService
    def TopPostsService



    def index() {
        def recentShares = RecentSharesService.serviceMethod()
        def topPosts=TopPostsService.serviceMethod()
        if (session.currentUser) {
            def userTopicsAndSubscriptionsDetails = UserTopicsAndSubscriptionsService.totalTopicsAndSubscriptions(session.currentUser)
            def subscriptionDetails = UserSubscriptionDetailsService.subscriptions(session.currentUser)
            def trendingTopic = TrendingTopicService.serviceMethod()
            def unread = UserInboxService.unReadResource(session.currentUser.userName)
            def subs=Subscription.get()
            render(view: '/user/dashboard', model: [subs:subs,userDetails: userTopicsAndSubscriptionsDetails, subscriptionDetails: subscriptionDetails, trendingTopic: trendingTopic, userUnReadResource: unread])
        } else {
            render(view: 'index', model: [recentShares: recentShares,topPosts:topPosts])
        }
    }

    def userProfile() {
        User user = User.findById(params.user as Long)
        def recentShares = RecentSharesService.serviceMethod()
        def topPosts=TopPostsService.serviceMethod()
        if (session.currentUser) {
            def userTopicsAndSubscriptionsDetails = UserTopicsAndSubscriptionsService.totalTopicsAndSubscriptions(user)
            def subscriptionDetails = UserSubscriptionDetailsService.subscriptions(user)
            def trendingTopic = TrendingTopicService.serviceMethod()
            def userTopicDetails = UserTopicsService.topics(user)
            def userPost = UserPostsService.serviceMethod(user)
            render(view: '/user/userProfile', model: [thisUser: user, userDetails: userTopicsAndSubscriptionsDetails, subscriptionDetails: subscriptionDetails, trendingTopic: trendingTopic, userTopicDetails: userTopicDetails, userPost: userPost])
        } else {
            render(view: 'index', model: [recentShares: recentShares,topPosts: topPosts])
        }
    }

    def editUserProfile() {
        User user = session.currentUser
        def recentShares = RecentSharesService.serviceMethod()
        def topPosts=TopPostsService.serviceMethod()
        if (session.currentUser) {
            def userTopicsAndSubscriptionsDetails = UserTopicsAndSubscriptionsService.totalTopicsAndSubscriptions(user)
            def subscriptionDetails = UserSubscriptionDetailsService.subscriptions(user)
            def trendingTopic = TrendingTopicService.serviceMethod()
            def userTopicDetails = UserTopicsService.topics(user)
            def userPost = UserPostsService.serviceMethod(user)
            render(view: '/user/editUserProfile', model: [thisUser: user, userDetails: userTopicsAndSubscriptionsDetails, subscriptionDetails: subscriptionDetails, trendingTopic: trendingTopic, userTopicDetails: userTopicDetails, userPost: userPost])
        } else {
            render(view: 'index', model: [recentShares: recentShares,topPosts: topPosts])
        }
    }

    def updateUserProfile(){
        def userId=session.currentUser.id
        UpdateUserProfileService.serviceMethod(params,userId)
        session.currentUser=User.get(userId)
        redirect(url:'/User/editUserProfile')
    }

    def changeUserPassword(){
        def userId=session.currentUser.id
        if(UpdateUserProfileService.changePassword(params,userId)){
            session.invalidate()
            flash.message="Password changed Successfully"
            redirect(url:'/User')
        }else{
            flash.error="Password Mismatch"
            redirect(url:'/User/editUserProfile')
        }
    }
}
