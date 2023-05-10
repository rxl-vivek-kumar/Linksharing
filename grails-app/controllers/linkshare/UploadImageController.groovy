package linkshare
import org.springframework.web.multipart.MultipartFile

class UploadImageController {

    def index() { }
    def saveImage() {
        MultipartFile file = request.getFile('image')
        if (!file.isEmpty()) {
            file.transferTo(new File("assets/images/userPhoto" + file.getOriginalFilename()))
        }
    }
}

