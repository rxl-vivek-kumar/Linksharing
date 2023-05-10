package linkshare

import grails.gorm.transactions.Transactional


class RegisterUserService {
def UploadPhotoService
    def serviceMethod(def params) {

    }
    def register(def params){
        User user=new User()
        user.firstName=params.firstName
        user.lastName=params.lastName
        user.email=params.email
        user.userName=params.userName
        user.password=params.password

        if(params.photo){
            def multipartFile=params.photo
            def photoExtension=multipartFile.getOriginalFilename().tokenize('.')[-1]
            def bytes=multipartFile.getBytes()
            def url="grails-app/assets/images/profilePhoto/${params.userName}.${photoExtension}"
            def newFile=new File("${url}")
            newFile.createNewFile()
            newFile.append(bytes)
            params.photo=url.substring(25)
            user.photo=params.photo
        }
        user.validate()
        if(user.hasErrors()){
            
        }
        else  {
            user.save(flush:true,failOnError:true)
        }

    }

}
