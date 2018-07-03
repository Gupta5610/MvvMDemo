//
//  Webservice.swift
//  MvvmDemoApp
//
//  Created by ashish on 01/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation


class WebService {
    public private(set) static var instance = WebService();
    
    public func AuthenticateUser(user : User , completion : @escaping (Bool,String?) -> Void ){
        FirebaseHandler.instance.singIn(userName: user.email, password: user.password, completion: { (status,error) in
            completion(status,error);
            
        })
    }
    
    func registerUser(user : User , completion :@escaping (Bool,String?) -> Void){
        FirebaseHandler.instance.registerUser(userName: user.email, password: user.password) { (status,error) in
            DispatchQueue.main.async {
                completion(status,error);
            }
        }
    }
    
    func signOut(completion : @escaping (Bool,String?) -> Void){
        FirebaseHandler.instance.signOut { (status, error) in
            DispatchQueue.main.async {
                completion(status,error);
            }
        }
    }
    
    func post(parameter : [String : Any] , to  databaseReference: String ){
        FirebaseHandler.instance.post(parameter: parameter, to: databaseReference)
    }
    
    func observe(databaseReference : String , completion : @escaping ([String : Any]?) -> (Void)){
        FirebaseHandler.instance.observe(databaseReference: databaseReference) { (dataDictionary) -> (Void) in
            DispatchQueue.main.async {
                completion(dataDictionary)
            }
        }
    }
    
    func subscribeNotification(to topic : String){
        FirebaseHandler.instance.subscribe(to: topic)
    }
    
}
