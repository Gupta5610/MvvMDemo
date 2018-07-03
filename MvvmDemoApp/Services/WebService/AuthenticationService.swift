//
//  AuthenticationService.swift
//  Login Module
//
//  Created by ashish on 27/03/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation
import Firebase

class AuthenticationService {
    
    public private(set) static var instance = AuthenticationService();
    
    public func AuthenticateUser(user : User , completion : @escaping (Bool,String?) -> Void ){
        WebService.instance.AuthenticateUser(user:user, completion: { (status,error) in
                completion(status,error);
        })
    }
}






