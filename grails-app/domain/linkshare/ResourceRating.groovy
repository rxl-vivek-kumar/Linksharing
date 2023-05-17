package linkshare

class ResourceRating {

    Integer score
    static belongsTo =[resource:Resource,user:User]
    static constraints = {
        score min:1, max:5
    }
}
