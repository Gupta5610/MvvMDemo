//
//  RoundUIButton.swift
//  MvvmDemoApp
//
//  Created by ashish on 27/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import UIKit

class RoundUIButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
    }

}
