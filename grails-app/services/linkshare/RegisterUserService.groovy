package linkshare


class RegisterUserService {


    def serviceMethod() {
    }

    def register(def params){
        User user=new User()
        if(User.findByEmail(params.email)){
            return "Email already registered "
        }
        else if(User.findByUserName(params.userName)){
            return "userName not available"
        }else if(params.password!=params.confirmPassword){
            return "Password mismatch"
        }else{
            user.firstName=params.firstName
            user.lastName=params.lastName
            user.email=params.email
            user.userName=params.userName
            user.password=params.password
            if(params.photo && !params.photo.isEmpty()){
                def multipartFile=params.photo
                def photoExtension=multipartFile.getOriginalFilename().tokenize('.')[-1]
                def bytes=multipartFile.getBytes()
                def url="grails-app/assets/images/profilePhoto/${params.userName}.${photoExtension}"
                def newFile=new File("${url}")
                newFile.createNewFile()
                newFile.append(bytes)
                params.photo=url.substring(25)
                user.photo=params.photo
            }else{
                user.photo='profilePhoto/defaultPhoto.svg'
            }
            user.validate()
            if(user.hasErrors()){
                return "Password Length should be between 5 and 8"
            }
            else  {
                user.save(flush:true,failOnError:true)
                return ""
            }
        }
        return ""
    }

}
