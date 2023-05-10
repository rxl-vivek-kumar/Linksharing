package linkshare

class UserController {
    def UserTopicsAndSubscriptionsService
    def RecentSharesService
    def UserSubscriptionDetailsService

    def index() {
        def recentShares=RecentSharesService.serviceMethod()
        if(session.currentUser){
            def userTopicsAndSubscriptionsDetails = UserTopicsAndSubscriptionsService.totalTopicsAndSubscriptions(session.currentUser)
            def subscriptionDetails=UserSubscriptionDetailsService.subscriptions(session.currentUser)
            render(view:'/user/dashboard', model:[userDetails:userTopicsAndSubscriptionsDetails, subscriptionDetails:subscriptionDetails])

        }
        else{

            render (view:'index',model:[recentShares:recentShares])

        }
    }

}
