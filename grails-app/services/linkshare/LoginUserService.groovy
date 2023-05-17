package linkshare

import grails.gorm.transactions.Transactional

class LoginUserService {

    def serviceMethod(def params) {
        String userEmail=params.loginEmail
        String userPassword=params.loginPassword
        User u = User.findByEmailOrUserName(userEmail,userEmail);
        String out=""

        if(!u){
            out="User doesn't exist"
        }
        else if(u.password==userPassword){
        }
        else{
            out="Wrong Password"
        }
        return out
    }
}
