//
//  RegistrationVCProtocol.swift
//  MvvmDemoApp
//
//  Created by ashish on 09/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

protocol RegistrationVCProtocol : UserManagementBaseProtocol {
    func updatePhoneNumberTextField(with number : String)
    func updateRepeatPasswordTextField(with password: String)
}
