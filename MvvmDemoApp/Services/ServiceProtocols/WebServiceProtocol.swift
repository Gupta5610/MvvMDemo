//
//  WebServiceProtocol.swift
//  MvvmDemoApp
//
//  Created by ashish on 07/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation


protocol WebServiceProtocol {
    func AuthenticateUser(user : User , completion : @escaping (Bool,String?) -> Void )
    func registerUser(user : User , completion :@escaping (Bool,String?) -> Void)
    func signOut(completion : @escaping (Bool,String?) -> Void)
    func post(parameter : [String : Any] , to  databaseReference: String )
    func observe(databaseReference : String , completion : @escaping ([String : Any]?) -> (Void))
    func subscribeNotification(to topic : String)
    func unSubscribeNotification(from topic : String)
}
