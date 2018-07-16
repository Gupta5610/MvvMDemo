//
//  UserListViewModel.swift
//  MvvmDemoApp
//
//  Created by ashish on 01/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

class UserListViewModel {
    
    var delegate : UserListVCDelegate?
    
    var cache = NSCache<NSString,NSData>()

    var userList = [UserCellViewModel](){
        didSet{
            delegate?.updateTableView()
        }
    }
    var dataService : DataServiceProtocol!
    
    init(dataService : DataServiceProtocol) {
        self.dataService = dataService
    }
    
    func loadUsers(completion : @escaping () -> (Void)){
        self.dataService.observeUsers(from: "users") { (userList) -> (Void) in
            if let userList = userList {
                
                self.userList = [UserCellViewModel]()
                userList.forEach({ (user) in
                    self.userList.append(UserCellViewModel.init(user: user))
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
    
    
    func downloadImageWithName(name : String,completion : @escaping (Data?) -> (Void)){
        
        if let data = self.cache.object(forKey: name as NSString ){
            completion(data as Data)
        }else{
            dataService.getImageDataForUserWith(email: name, completion: { (data, error) -> (Void) in
                if let data = data  {
                    DispatchQueue.main.async {
                        self.cache.setObject(data as NSData, forKey: name as NSString)
                        completion(data)
                    }
                }
            })
                
        }
      }
    }    

