//
//  Webservice.swift
//  MvvmDemoApp
//
//  Created by ashish on 01/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation


class WebService : WebServiceProtocol {
    public private(set) static var instance = WebService(firebaseHandler: FirebaseHandler.instance);
    
    var firebaseHandler : FirebaseProtocol!
    
    init(firebaseHandler : FirebaseProtocol) {
        self.firebaseHandler = firebaseHandler
    }
    
    func AuthenticateUser(user : User , completion : @escaping (Bool,String?) -> Void ){
        firebaseHandler.singIn(userName: user.email, password: user.password, completion: { (status,error) in
            completion(status,error);
            
        })
    }
    
    func registerUser(user : User , completion :@escaping (Bool,String?) -> Void){
        firebaseHandler.registerUser(userName: user.email, password: user.password) { (status,error) in
            DispatchQueue.main.async {
                completion(status,error);
            }
        }
    }
    
    func signOut(completion : @escaping (Bool,String?) -> Void){
        firebaseHandler.signOut { (status, error) in
            DispatchQueue.main.async {
                completion(status,error);
            }
        }
    }
    
    func post(parameter : [String : Any] , to  databaseReference: String ){
        firebaseHandler.post(parameter: parameter, to: databaseReference)
    }
    
    func observe(databaseReference : String , completion : @escaping ([String : Any]?) -> (Void)){
        firebaseHandler.observe(databaseReference: databaseReference) { (dataDictionary) -> (Void) in
            DispatchQueue.main.async {
                completion(dataDictionary)
            }
        }
    }
    
    func subscribeNotification(to topic : String){
        firebaseHandler.subscribe(to: topic)
    }
    
    func unSubscribeNotification(from topic : String){
        firebaseHandler.unSubscribe(from : topic)
    }
    
}
