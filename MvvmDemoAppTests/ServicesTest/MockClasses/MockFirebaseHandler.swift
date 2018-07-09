//
//  mockFirebaseHandler.swift
//  MvvmDemoAppTests
//
//  Created by ashish on 09/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
@testable import MvvmDemoApp


class MockFirebaseHandler : FirebaseProtocol {
    func singIn(userName : String?,password : String? , completion :@escaping (Bool,String?) -> Void){
        completion(true,nil)
    }
    
    
    func registerUser(userName : String?,password : String? , completion : @escaping (Bool,String?) -> Void){
        completion(true,nil)
    }
    
    func signOut(completion : @escaping (Bool,String?) -> Void){
        completion(true,nil)
    }
    
    func post(parameter : [String : Any] , to : String){
        
    }
    
    func observe(databaseReference : String , completion : @escaping ([String : Any]?) -> (Void)){
        completion(["asfafasw" :[:]])
    }
    
    func subscribe(to topic : String){
        
    }
    func unSubscribe(from topic : String){
        
    }
}
