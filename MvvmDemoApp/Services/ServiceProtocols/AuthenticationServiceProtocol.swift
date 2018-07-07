//
//  AuthenticationServiceProtocol.swift
//  MvvmDemoApp
//
//  Created by ashish on 07/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

protocol AuthenticationServiceProtocol {
    func AuthenticateUser(user : User , completion : @escaping (Bool,String?) -> Void )
}
