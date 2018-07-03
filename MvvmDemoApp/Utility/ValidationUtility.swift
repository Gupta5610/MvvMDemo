//
//  ValidationUtility.swift
//  MvvmDemoApp
//
//  Created by ashish on 27/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

class ValidationUtility {
    static  func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    static func isValidPhoneNumber(testPhoneNumver : String) -> Bool{
        
        let phoneNumverRegex = "^\\(?([0-9]{3})\\)?([ .-]?)([0-9]{3})\\2([0-9]{4})"
        
        let phoneNumberTest = NSPredicate(format: "SELF MATCHES %@", phoneNumverRegex)
        return phoneNumberTest.evaluate(with: testPhoneNumver)
    }
    
    static func isValidPassword(testPassword : String) -> Bool {
        
        let passwordString : NSString = NSString(string: testPassword)
        var returnValue = true
        let passwordRegEx = String("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")
        
        do {
            let regex = try NSRegularExpression(pattern: passwordRegEx)
            let nsString = passwordString
            let results = regex.matches(in: passwordString as String, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return returnValue
    }
}
