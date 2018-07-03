//
//  UserTableViewCell.swift
//  MvvmDemoApp
//
//  Created by ashish on 01/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    func configure(email : String , phoneNumber : String){
        self.emailLabel.text = email
        self.phoneNumberLabel.text = phoneNumber
    }
    
    
}
