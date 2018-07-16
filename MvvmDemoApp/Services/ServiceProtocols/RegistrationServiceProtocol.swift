//
//  RegistrationServiceProtocol.swift
//  MvvmDemoApp
//
//  Created by ashish on 07/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

protocol RegistrationServiceProtocol {
    func registerUser(user : User , completion :@escaping (Bool,Error?) -> Void)
}
