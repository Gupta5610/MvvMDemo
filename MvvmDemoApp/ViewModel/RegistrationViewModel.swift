//
//  RegistrationViewModel.swift
//  MvvmDemoApp
//
//  Created by ashish on 26/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
import UIKit


class RegistrationViewModel
{
    var userEmail : String!{
        didSet{
            self.delegate?.updateEmailTextField(with: userEmail)
        }
    }
    
    var password : String!{
        didSet{
            self.delegate?.updatePasswordTextFeild(with: password)
        }
    }
    

    var phoneNumber : String!{
        didSet{
            self.delegate?.updatePhoneNumberTextField(with: phoneNumber)
        }
    }
    
    var repeatPassword : String!{
        didSet{
            self.delegate?.updateRepeatPasswordTextField(with: repeatPassword)
        }
    }
    
    var errorMessage : String!{
        didSet{
            self.delegate?.updateErrorLabel(with: errorMessage)
        }
    }
    
    var userImage : UIImage?{
        didSet{
            self.delegate?.updateImageView(with: userImage!)
        }
    }
    
    var registrationService : RegistrationServiceProtocol!
    var delegate : RegistrationDelegate?
    
    init(registrationService : RegistrationServiceProtocol) {
        self.registrationService = registrationService;
    }

    func save(compeletion : @escaping (Bool,RegistrationErrorCode?) -> ()){
        let userViewModel = UserViewModel(registrationViewModel: self)
        
        userViewModel.isValidRegistration(completion: {
            isValid,description,errorCode in
            
            if !isValid{
                switch errorCode! {
                case .InvalidEmail:
                    self.userEmail = ""
                case .InvalidPassword:
                    self.password = ""
                case .PasswordMatch:
                    self.password = ""
                    self.repeatPassword = ""
                case .InvalidPhoneNumber:
                    self.phoneNumber = ""
                }
               self.errorMessage = description!
               compeletion(false,errorCode)
            }else{
            let user = userViewModel.createUser()
            self.registrationService.registerUser(user: user, completion: {
                registered,errorMessage in
                if registered {
                    DataService.instance.post(user: user, to: "users",completion: {
                        DispatchQueue.main.async {
                            compeletion(true,nil)
                        }
                    })
                }else {
                    compeletion(false,nil)
                }
            })
            
            }
        })
    
    }
    
}
