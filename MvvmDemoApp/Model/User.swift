//
//  User.swift
//  MvvmDemoApp
//
//  Created by ashish on 26/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

class User {
    var email : String?
    var password : String?
    var phoneNumber : String?
    
    init(email : String , password : String , phoneNumber :String?){
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber ?? ""
    }
}
