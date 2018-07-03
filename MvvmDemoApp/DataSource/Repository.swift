//
//  Repository .swift
//  MvvmDemoApp
//
//  Created by ashish on 26/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

class Repository{
    
    static var instance = Repository()
    
    var users = [User(email: "ashish.gupta04@nagarro.com", password: "Nokia@5610", phoneNumber: "7838673071"),
                 User(email: "deepika.kumar@nagarro.com", password: "Nokia@5610", phoneNumber: "4204204204")]
    
    func loadUsers() -> [User]
    {
        return users
    }
    
    func authenticate(user userToBeAuthenticated:User , completion : @escaping (Bool) -> ()){
        var flag = false
        users.forEach({
            user in
            if userToBeAuthenticated.email == user.email && userToBeAuthenticated.password == user.password {
                flag = true
            }
        })
        completion(flag)
    }
    
    func add(user : User){
        self.users.append(user)
    }
    
}
