//
//  UserDetailViewProtocol.swift
//  MvvmDemoApp
//
//  Created by ashish on 15/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

protocol UserDetailViewDelegate {
    func updateImageWith(data : Data)
    func updateEmailLabelWith(value : String)
    func updatePhoneNumberLabelWith(value : String)
}
