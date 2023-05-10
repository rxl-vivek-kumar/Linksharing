package linkshare

import grails.gorm.transactions.Transactional


class UploadPhotoService {

    def serviceMethod() {

    }
    def savePhoto(def params, def user){
        def multipartFile=params.photo
        def photoExtension=multipartFile.getOriginalFilename().tokenize('.')[-1]
        def bytes=multipartFile.getBytes()
        def url="grails-app/assets/images/profilePhoto/${params.userName}.${photoExtension}"
        def newFile=new File("${url}")
        newFile.createNewFile()
        newFile.append(bytes)
        params.photo=url
        user.photo=params.photo
    }
}
