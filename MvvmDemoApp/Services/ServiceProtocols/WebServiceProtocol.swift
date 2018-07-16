//
//  WebServiceProtocol.swift
//  MvvmDemoApp
//
//  Created by ashish on 07/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation


protocol WebServiceProtocol {
    func AuthenticateUser(user : User , completion : @escaping (Bool,Error?) -> Void )
    func registerUser(user : User , completion :@escaping (Bool,Error?) -> Void)
    func signOut(completion : @escaping (Bool,Error?) -> Void)
    func post(parameter : [String : Any] , imageData : Data? , to  databaseReference: String , completion : @escaping () -> () )
    func observe(databaseReference : String , completion : @escaping ([String : Any]?) -> (Void))
    func subscribeNotification(to topic : String)
    func unSubscribeNotification(from topic : String)
    func downloadFile(with name : String , completion : @escaping (Data?,Error?) -> (Void))
}
