//
//  UserViewModel.swift
//  MvvmDemoApp
//
//  Created by ashish on 27/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
import UIKit


class UserViewModel{
    
    var email : String?
    var password : String?
    var phoneNumber : String?
    var repeatPassword : String?
    var userImage : UIImage?
    
    init(user : User ) {
        self.email = user.email
        self.phoneNumber = user.phoneNumber
        self.password = user.password
    }
    
    init(registrationViewModel : RegistrationViewModel){
        self.email = registrationViewModel.userEmail
        self.password = registrationViewModel.password
        self.phoneNumber = registrationViewModel.phoneNumber
        self.repeatPassword = registrationViewModel.repeatPassword
        self.userImage = registrationViewModel.userImage
    }
    
    init(loginViewModel : LoginViewModel) {
        self.email = loginViewModel.email
        self.password = loginViewModel.password
    }
    
    func createUser() -> User {
        return User(email: self.email!, password: self.password!, phoneNumber: self.phoneNumber,image : self.userImage)
    }
    
    func isValidLogin(completion : @escaping (Bool,String?,LoginErrorCode?) -> ()){
        if !ValidationUtility.isValidEmail(testStr: email!){
            completion(false,ErrorMessages.InvalidEmailFormat,.InvalidEmailFormat)
        }else if !ValidationUtility.isValidPassword(testPassword: password!){
            completion(false,ErrorMessages.InvalidPasswordFormat,.InvalidPasswordFormat)
        }else{
            completion(true,nil,nil)
        }
    }
    
    func isValidRegistration(completion : @escaping (Bool,String?,RegistrationErrorCode?) -> ()){
        
        if (!ValidationUtility.isValidEmail(testStr: email!)){
           completion(false,ErrorMessages.InvalidEmailFormat,.InvalidEmail)
        }
        else if (!ValidationUtility.isValidPhoneNumber(testPhoneNumver: phoneNumber!)){
            completion(false,ErrorMessages.InvalidPhoneNumberFormat,.InvalidPhoneNumber)
        }
        else if (password != repeatPassword){
            completion(false,ErrorMessages.PasswordDontMatch,.PasswordMatch)
        }else{
        completion(true,nil,nil)
        }
    }
    
}
