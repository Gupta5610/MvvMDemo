//
//  BindingUITextField.swift
//  MvvmDemoApp
//
//  Created by ashish on 26/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import UIKit

class BindingUITextField: UITextField {

    typealias Listener = (String) -> Void
    var listner : Listener?
    
    func bind(_ completion : @escaping (String) -> Void){
        
        self.listner = completion
        self.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingChanged)
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let listner = self.listner else { return }
        listner(textField.text!)
    }
    
    func ErrorShake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4, y: self.center.y));
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4, y: self.center.y));
        self.layer.add(animation, forKey: "position")
    }
}
