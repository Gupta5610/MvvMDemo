//
//  RegistrationVCProtocol.swift
//  MvvmDemoApp
//
//  Created by ashish on 09/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
import UIKit

protocol RegistrationDelegate : UserManagementBaseDelegate {
    func updatePhoneNumberTextField(with number : String)
    func updateRepeatPasswordTextField(with password: String)
    func updateImageView(with image:UIImage)
}
