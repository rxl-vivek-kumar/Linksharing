package linkshare


class ResourceRating {
    Resource resource;
    User user;
    Integer score;
    static hasMany=[user:User]
    static belongsTo =[resources:Resource,users:User]
    static constraints = {
        score min:1, max:5
    }
    static mapping={
       table 'ResourceRating'
    }
}
