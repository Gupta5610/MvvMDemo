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
    @IBOutlet weak var UserImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
    }
    
    func configure(email : String , phoneNumber : String){
        self.emailLabel.text = email
        self.phoneNumberLabel.text = phoneNumber
    }
    
    func setImage(image : UIImage){
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.UserImageView.image = image
    }
}
