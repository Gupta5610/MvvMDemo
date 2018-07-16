//
//  RoundImagePickerView.swift
//  MvvmDemoApp
//
//  Created by ashish on 11/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import UIKit

class RoundImagePickerView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.width/2
    }
    
    

}
