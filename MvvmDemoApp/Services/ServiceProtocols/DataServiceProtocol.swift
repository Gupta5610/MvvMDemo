//
//  DataServiceProtocol.swift
//  MvvmDemoApp
//
//  Created by ashish on 07/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

protocol DataServiceProtocol {
    func post(user : User , to databseReference : String,completion : @escaping () -> (Void))
    func observeUsers(from databaseReference : String , completion : @escaping ([User]?) -> (Void))
    func getImageDataForUserWith(email : String , completion : @escaping (Data?,Error?) -> (Void))
}
