

//
//  FirebaseHandler.swift
//  Login Module
//
//  Created by ashish on 29/03/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseHandler {
    
    private(set) static var instance = FirebaseHandler()

    func singIn(userName : String?,password : String? , completion :@escaping (Bool,String?) -> Void){
        FIRUsermanagementService.instance.singIn(userName: userName, password: password) { (status, error) in
            completion(status,error)
        }
    }
    
    func registerUser(userName : String?,password : String? , completion : @escaping (Bool,String?) -> Void){
        FIRUsermanagementService.instance.registerUser(userName: userName, password: password) { (status, error) in
            completion(status,error)
        }
    }
    
    func signOut(completion : @escaping (Bool,String?) -> Void){
        FIRUsermanagementService.instance.signOut { (status, error) in
            completion(status,error)
        }
    }
    
    func post(parameter : [String : Any] , to : String){
        FIRDatabaseService.instance.post(parameter: parameter, to: FIRDatabaseReference.init(with: to)!)
    }
    
    func observe(databaseReference : String , completion : @escaping ([String : Any]?) -> (Void)){
        FIRDatabaseService.instance.observe(FIRDatabaseReference.init(with: databaseReference)!) { (dataSnapshot) -> (Void) in
            
            completion(dataSnapshot?.value as! [String : Any])
        }
    }
    
    func subscribe(to topic : String){
        FIRNotificationService.instance.subscribe(to: SubscriptionTopic.init(string: topic)!)
    }
}
