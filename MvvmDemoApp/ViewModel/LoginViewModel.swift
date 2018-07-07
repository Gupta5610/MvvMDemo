
//  LoginViewModel.swift
//  MvvmDemoApp
//
//  Created by ashish on 27/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var email = Dynamic<String>("")
    var password = Dynamic<String>("")
    
    var dataService : DataService!
    var authenticationService : AuthenticationServiceProtocol!
    var errorMessage = Dynamic<String>("")
    
    init(authenticationService : AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }
    
    func logIn(completion : @escaping (Bool,LoginErrorCode?) -> ()){
       let userViewModel = UserViewModel(loginViewModel: self)
    
        userViewModel.isValidLogin(completion: {
            isValid,error,errorCode  in
            
            if !isValid {
                self.errorMessage.value = error!
                self.password.value = ""
                completion(isValid,errorCode)
            }else{
                let user = userViewModel.createUser()
                
                self.authenticationService.AuthenticateUser(user: user, completion: {
                    isValid,errorMessage in
                    
                    var code : LoginErrorCode? = errorCode
                    if !isValid {
                        self.errorMessage.value = ErrorMessages.InvalidEmailandPassword
                        self.password.value = ""
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
