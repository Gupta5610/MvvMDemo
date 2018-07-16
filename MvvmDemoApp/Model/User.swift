//
//  User.swift
//  MvvmDemoApp
//
//  Created by ashish on 26/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
import UIKit

class User {
    var email : String?
    var password : String?
    var phoneNumber : String?
    var userImageUrl : String?
    var userImage : UIImage?
    
    init(email : String , password : String , phoneNumber :String?){
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber ?? ""
    }
    
    convenience init(email : String , password : String , phoneNumber :String?,image : UIImage?) {
        self.init(email: email, password: password, phoneNumber: phoneNumber)
        self.userImage = image
        self.userImageUrl = nil
    }
    
    convenience init(email : String , password : String , phoneNumber :String?,url : String?) {
        self.init(email: email, password: password, phoneNumber: phoneNumber)
        self.userImageUrl = url
        self.userImage = nil
        self.password = nil
    }
}
