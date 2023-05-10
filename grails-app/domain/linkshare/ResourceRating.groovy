package linkshare

class ResourceRating {

    Integer score;
      Resource resource
    static belongsTo =[resource:Resource,user:User]
    static constraints = {
        score min:1, max:5
    }
}
