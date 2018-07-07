//
//  RegistrationService.swift
//  Login Module
//
//  Created by ashish on 27/03/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation

class RegistrationService : RegistrationServiceProtocol {
    
    private(set) static var instance = RegistrationService();
    
    func registerUser(user : User , completion :@escaping (Bool,String?) -> Void){
        WebService.instance.registerUser(user : user) { (status,error) in
            DispatchQueue.main.async {
                completion(status,error);
            }
        }
    }
}
