package linkshare


class User {
    String email;
    String userName;
    String password;
    String firstName;
    String lastName;
    byte[] photo;
    boolean isAdmin;
    Date dateCreated;
    Date lastUpdated;

    static hasMany=[topics:Topic,resourceRatings:ResourceRating,resources:Resource,
                    subscriptions: Subscription,readingItems:ReadingItem]

    static constraints = {
        isAdmin default:false
        email unique:true
        userName unique:true
        password  blank:false, maxsize:8, minsize:5,validator:{val,obj->
                  if(val.length()<8) {
                      return false}
                   }
        firstName nullable:false
        lastName nullable:true
        photo nullable:true
    }
    static mapping = {
        table 'LocalUser'
    }
}