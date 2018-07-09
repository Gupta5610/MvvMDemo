
//  LoginViewModel.swift
//  MvvmDemoApp
//
//  Created by ashish on 27/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var email : String!{
        didSet{
            self.delegate?.updateEmailTextField(with: email)
        }
    }
    
    var password : String!{
        didSet{
            self.delegate?.updatePasswordTextFeild(with: password)
        }
    }
    
    var errorMessage : String!{
        didSet{
            self.delegate?.updateErrorLabel(with: errorMessage)
        }
    }
    
    
    var dataService : DataService!
    var authenticationService : AuthenticationServiceProtocol!
    
    
    var delegate : LoginVCProtocol?
    
    init(authenticationService : AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }
    
    func logIn(completion : @escaping (Bool,LoginErrorCode?) -> ()){
       let userViewModel = UserViewModel(loginViewModel: self)
    
        userViewModel.isValidLogin(completion: {
            isValid,error,errorCode  in
            
            if !isValid {
                self.errorMessage = error!
                self.password = ""
                completion(isValid,errorCode)
            }else{
                let user = userViewModel.createUser()
                
                self.authenticationService.AuthenticateUser(user: user, completion: {
                    isValid,errorMessage in
                    
                    var code : LoginErrorCode? = errorCode
                    if !isValid {
                        self.errorMessage = ErrorMessages.InvalidEmailandPassword
                        self.password = ""
                        code = .InvalidEmailandPassword
                    }
                    DispatchQueue.main.async {
                        completion(isValid,code)
                    }
                })
            }
        })
        
    }
}
