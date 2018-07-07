//
//  DataServiceProtocol.swift
//  MvvmDemoApp
//
//  Created by ashish on 07/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

protocol DataServiceProtocol {
    func post(user : User , to databseReference : String)
    func observeUsers(from databaseReference : String , completion : @escaping ([User]?) -> (Void))
}
