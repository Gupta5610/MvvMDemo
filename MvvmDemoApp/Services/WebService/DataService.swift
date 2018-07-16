//
//  DataService.swift
//  MvvmDemoApp
//
//  Created by ashish on 27/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
import UIKit

class DataService : DataServiceProtocol {
    
    public private(set) static var instance = DataService(webService : WebService.instance)
    
    init(webService : WebServiceProtocol) {
        self.webService = webService
    }
    
    private var webService : WebServiceProtocol!
    
    func post(user : User , to databseReference : String,completion : @escaping () -> (Void)){
        var userParameter = [String : String]()
        userParameter["email"] = user.email!
        userParameter["number"] = user.phoneNumber!
        let data = UIImagePNGRepresentation(user.userImage!)
        webService.post(parameter: userParameter,imageData: data, to: databseReference){
            completion()
        }
    }
    
    func observeUsers(from databaseReference : String , completion : @escaping ([User]?) -> (Void)){
        
        webService.observe(databaseReference: databaseReference) { (dataDictionary) -> (Void) in
            guard let dataDictionary = dataDictionary else { return }
            var users = [User]()
            dataDictionary.forEach({(key,value) in
                let value = value as? [String : String] ?? nil
                if value != nil {
                    users.append(User(email: value!["email"]!, password: "", phoneNumber: value?["number"]))
                }
            })
            completion(users)
        }
        
    }
    
    func getImageDataForUserWith(email : String , completion : @escaping (Data?,Error?) -> (Void)){
        webService.downloadFile(with: email) { (data,error) -> (Void) in
            completion(data,error)
        }
    }
}
