//
//  UserCellViewModel.swift
//  MvvmDemoApp
//
//  Created by ashish on 13/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation


class UserCellViewModel {
    var email : String?
    var phoneNumber : String?
    var imageUrl : String?
    
    init (user : User){
        self.email = user.email
        self.phoneNumber = user.phoneNumber
        self.imageUrl = user.userImageUrl
    }
    
}
