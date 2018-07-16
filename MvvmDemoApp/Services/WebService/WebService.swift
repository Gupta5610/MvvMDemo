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
    
    func AuthenticateUser(user : User , completion : @escaping (Bool,Error?) -> Void ){
        firebaseHandler.singIn(userName: user.email, password: user.password, completion: { (status,error) in
            completion(status,error);
            
        })
    }
    
    func registerUser(user : User , completion :@escaping (Bool,Error?) -> Void){
        firebaseHandler.registerUser(userName: user.email, password: user.password) { (status,error) in
            DispatchQueue.main.async {
                completion(status,error);
            }
        }
    }
    
    func signOut(completion : @escaping (Bool,Error?) -> Void){
        firebaseHandler.signOut { (status, error) in
            DispatchQueue.main.async {
                completion(status,error);
            }
        }
    }
    
    func post(parameter : [String : Any], imageData : Data? , to  databaseReference: String , completion : @escaping () -> () ){
        
        var metaData = [String : String]()
        
        metaData["name"] = parameter["email"] as! String
        metaData["content-type"] = "image/png"
        
        firebaseHandler.uploadFileToDatabaseStorage(with: imageData!, andwith: metaData) { (urlPath,error) -> (Void) in
            var postParameter = [String : String]()
           
            if urlPath != nil {
            parameter.forEach({ (arg) in
                let (key, Value) = arg
                postParameter[key] = Value as? String
            })
            postParameter["ImageUrl"] = urlPath
            self.firebaseHandler.post(parameter: postParameter, to: databaseReference)
            }
            
            completion()
        }
    }
    
    func observe(databaseReference : String , completion : @escaping ([String : Any]?) -> (Void)){
        firebaseHandler.observe(databaseReference: databaseReference) { (dataDictionary) -> (Void) in
            DispatchQueue.main.async {
                completion(dataDictionary)
            }
        }
    }
    
    func downloadFile(with name : String , completion : @escaping (Data?,Error?) -> (Void)){
        firebaseHandler.downloadFileFromStorage(with: name) { (data,error) -> (Void) in
            completion(data,error)
        }
    }
    
    func subscribeNotification(to topic : String){
        firebaseHandler.subscribe(to: topic)
    }
    
    func unSubscribeNotification(from topic : String){
        firebaseHandler.unSubscribe(from : topic)
    }
}
