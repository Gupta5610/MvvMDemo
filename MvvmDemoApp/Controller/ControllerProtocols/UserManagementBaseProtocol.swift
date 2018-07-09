//
//  UserManagementBaseProtocol.swift
//  MvvmDemoApp
//
//  Created by ashish on 09/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation


protocol UserManagementBaseProtocol {
    func updateEmailTextField(with email: String)
    func updatePasswordTextFeild(with password: String)
    func updateErrorLabel(with errorMessage: String)
}
