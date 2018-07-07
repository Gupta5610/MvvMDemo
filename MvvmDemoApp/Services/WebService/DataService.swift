//
//  DataService.swift
//  MvvmDemoApp
//
//  Created by ashish on 27/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

class DataService : DataServiceProtocol {
    
    public private(set) static var instance = DataService(webService : WebService.instance)
    
    init(webService : WebServiceProtocol) {
        self.webService = webService
    }
    
    private var webService : WebServiceProtocol!
    
    func post(user : User , to databseReference : String){
        var userParameter = [String : String]()
        userParameter["email"] = user.email!
        userParameter["number"] = user.phoneNumber!
        webService.post(parameter: userParameter, to: databseReference)
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
   
}
