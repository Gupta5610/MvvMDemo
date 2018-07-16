//
//  RegistrationService.swift
//  Login Module
//
//  Created by ashish on 27/03/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation

class RegistrationService : RegistrationServiceProtocol {
    
    private(set) static var instance = RegistrationService(webService: WebService.instance);
    
    init(webService : WebServiceProtocol) {
        self.webService = webService
    }
    
    private var webService : WebServiceProtocol!
    
    func registerUser(user : User , completion :@escaping (Bool,Error?) -> Void){
        webService.registerUser(user : user) { (status,error) in
                completion(status,error);
        }
    }
}
