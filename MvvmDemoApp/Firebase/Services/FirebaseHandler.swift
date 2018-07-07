

//
//  FirebaseHandler.swift
//  Login Module
//
//  Created by ashish on 29/03/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation
import FirebaseDatabase

protocol FirebaseProtocol {
    func singIn(userName : String?,password : String? , completion :@escaping (Bool,String?) -> Void)
    func registerUser(userName : String?,password : String? , completion : @escaping (Bool,String?) -> Void)
    func signOut(completion : @escaping (Bool,String?) -> Void)
    func post(parameter : [String : Any] , to : String)
    func observe(databaseReference : String , completion : @escaping ([String : Any]?) -> (Void))
    func subscribe(to topic : String)
    func unSubscribe(from topic : String)
}



class FirebaseHandler : FirebaseProtocol {
    
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
            completion(dataSnapshot?.value as? [String : Any])
        }
    }
    
    func subscribe(to topic : String){
        FIRNotificationService.instance.subscribe(to: SubscriptionTopic.init(string: topic)!)
    }
    
    func unSubscribe(from topic : String){
        FIRNotificationService.instance.unSubscribe(from: SubscriptionTopic.init(string: topic)!)
    }
}
