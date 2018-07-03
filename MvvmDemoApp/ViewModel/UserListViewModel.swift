//
//  UserListViewModel.swift
//  MvvmDemoApp
//
//  Created by ashish on 01/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

class UserListViewModel {
    
    var userList = [UserViewModel]()
    var dataService : DataService!
    
    init(dataService : DataService) {
        self.dataService = dataService
    }
    
    func loadUsers(completion : @escaping () -> (Void)){
        self.dataService.observeUsers(from: "users") { (userList) -> (Void) in
            if let userList = userList {
                
                self.userList = [UserViewModel]()
                userList.forEach({ (user) in
                    self.userList.append(UserViewModel.init(user: user))
                })
                    completion()
            }
        }
    }
    
    func signOut(completion : @escaping ()->(Void)){
        WebService.instance.signOut { (status, Error) in
            if status{
                completion()
            }
            else{
                print(Error!)
            }
        }
    }

}
