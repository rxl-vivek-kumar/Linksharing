package linkshare

class User {
    String email
    String userName
    String password
    String firstName
    String lastName
    String photo="defaultPhoto.svg"
    boolean isAdmin
    Date dateCreated
    Date lastUpdated

    static hasMany = [topic:Topic,resourceRating:ResourceRating,resource:Resource,
                      subscription: Subscription,readingItem:ReadingItem]

    static constraints = {
        isAdmin default:false
        email unique:true
        userName unique:true
        password  blank:false, maxsize:8, minsize:5,validator:{val,obj->
            if(val.length()<8) {
                return false}
        }
        firstName nullable:false
        lastName nullable:false
    }
    static mapping = {
        table 'User_Table'
    }
}
