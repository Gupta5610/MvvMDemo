//
//  AuthenticationService.swift
//  Login Module
//
//  Created by ashish on 27/03/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation
import Firebase

class AuthenticationService : AuthenticationServiceProtocol {
    
    public private(set) static var instance = AuthenticationService(webService: WebService.instance);
    
    init(webService : WebServiceProtocol) {
        self.webService = webService
    }
    
    private var webService : WebServiceProtocol!
    
    public func AuthenticateUser(user : User , completion : @escaping (Bool,String?) -> Void ){
        webService.AuthenticateUser(user:user, completion: { (status,error) in
                completion(status,error);
        })
    }
}






