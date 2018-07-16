

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
    func singIn(userName : String?,password : String? , completion :@escaping (Bool,Error?) -> Void)
    func registerUser(userName : String?,password : String? , completion : @escaping (Bool,Error?) -> Void)
    func signOut(completion : @escaping (Bool,Error?) -> Void)
    func uploadFileToDatabaseStorage(with data : Data , andwith metaData : Any?, completion : @escaping (String?,Error?) -> (Void))
    func post(parameter : [String : Any] , to : String)
    func observe(databaseReference : String , completion : @escaping ([String : Any]?) -> (Void))
    func subscribe(to topic : String)
    func unSubscribe(from topic : String)
    func downloadFileFromStorage(with name : String , completion : @escaping (Data?,Error?) -> (Void))
}



class FirebaseHandler : FirebaseProtocol {
   
    private(set) static var instance = FirebaseHandler()
    
    func singIn(userName: String?, password: String?, completion: @escaping (Bool, Error?) -> Void) {
        FIRUsermanagementService.instance.singIn(userName: userName, password: password) { (status, error) in
            completion(status,error)
        }
    }
    
    func registerUser(userName: String?, password: String?, completion: @escaping (Bool, Error?) -> Void) {
        FIRUsermanagementService.instance.registerUser(userName: userName, password: password) { (status, error) in
            completion(status,error)
        }
    }
    
    func signOut(completion: @escaping (Bool, Error?) -> Void) {
        FIRUsermanagementService.instance.signOut { (status, error) in
            completion(status,error)
        }
    }
    
    func uploadFileToDatabaseStorage( with data: Data, andwith metaData: Any?, completion: @escaping (String?, Error?) -> (Void)) {
        FIRDatabaseService.instance.uploadFileToDatabaseStorage(with: data, andWith: metaData) { (urlPath,error)  -> (Void) in
            completion(urlPath,error)
        }
    }
    
    func downloadFileFromStorage(with name: String, completion: @escaping (Data?, Error?) -> (Void)) {
        FIRDatabaseService.instance.downloadFileFromDatabase(with: name) { (data,error) -> (Void) in
            completion(data,error)
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
