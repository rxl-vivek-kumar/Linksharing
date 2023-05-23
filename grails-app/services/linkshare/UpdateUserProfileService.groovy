package linkshare

import grails.gorm.transactions.Transactional

@Transactional
class UpdateUserProfileService {

    def serviceMethod(params,userId) {
        if(User.findByUserName(params?.userName)){
            return "userName not available"
        }
        User user=User.get(userId as Long)
        if(params?.firstName){
            user.firstName=params?.firstName
        }
        if(params?.lastName){
            user.lastName=params?.lastName
        }
        if(params?.userName){
            user.userName=params?.userName
        }
        if(params?.photo){
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
        if(user.save(flush:true,failOnError:true)){
            return "Profile Updated Successfully"
        }else{
            return "Internal Error Occured"
        }
    }

    def changePassword(params,userId){
        User user=User.get(userId)
        if(params.newPassword==params.confirmPassword){
            user.password=params.newPassword
            user.save(flush:true,failOnError:true)
            return true
        }else{
           return false
        }
    }
}
