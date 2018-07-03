//
//  RegistrationViewModel.swift
//  MvvmDemoApp
//
//  Created by ashish on 26/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation


class RegistrationViewModel
{
    var userEmail = Dynamic<String>("")
    var password = Dynamic<String>("")
    var phoneNumber = Dynamic<String>("")
    var repeatPassword = Dynamic<String>("")
    var errorMessage = Dynamic<String>("")
    var registrationService : RegistrationService!
    
    init(registrationService : RegistrationService) {
        self.registrationService = registrationService;
    }

    func save(compeletion : @escaping (Bool,RegistrationErrorCode?) -> ()){
        let userViewModel = UserViewModel(registrationViewModel: self)
        
        userViewModel.isValidRegistration(completion: {
            isValid,description,errorCode in
            
            if !isValid{
                switch errorCode! {
                case .InvalidEmail:
                    self.userEmail.value = ""
                case .InvalidPassword:
                    self.password.value = ""
                case .PasswordMatch:
                    self.password.value = ""
                    self.repeatPassword.value = ""
                case .InvalidPhoneNumber:
                    self.phoneNumber.value = ""
                }
               self.errorMessage.value = description!
               compeletion(false,errorCode)
            }else{
            let user = userViewModel.createUser()
            self.registrationService.registerUser(user: user, completion: {
                registered,errorMessage in
                if registered {
                 DataService.instance.post(user: user, to: "users")
                    DispatchQueue.main.async {
                        compeletion(true,nil)
                    }
                }else {
                    compeletion(false,nil)
                }
                
            })
            
            }
        })
    
    }
    
}
