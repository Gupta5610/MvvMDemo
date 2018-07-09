//
//  mockWebService .swift
//  MvvmDemoAppTests
//
//  Created by ashish on 09/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
@testable import MvvmDemoApp


class MockWebService : WebServiceProtocol {
    
    func signOut(completion: @escaping (Bool, String?) -> Void) {
        completion(true,nil)
    }
    
    func post(parameter: [String : Any], to databaseReference: String) {
        
    }
    
    func observe(databaseReference: String, completion: @escaping ([String : Any]?) -> (Void)) {
        completion(["asfafasw" :[:]])
    }
    
    func AuthenticateUser(user: User, completion: @escaping (Bool, String?) -> Void) {
        completion(true,nil)
    }
    
    func registerUser(user: User, completion: @escaping (Bool, String?) -> Void) {
        completion(true,nil)
    }
    
    func subscribeNotification(to topic: String) {
        
    }
    
    func unSubscribeNotification(from topic: String) {
        
    }
}
