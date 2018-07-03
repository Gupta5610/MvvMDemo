//
//  AlertControllerService.swift
//  MvvmDemoApp
//
//  Created by ashish on 28/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
import UIKit

class AlertControllerService{
    
    static func createAlertViewController(errorMessage : String) -> UIViewController{
        let alertController = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        return alertController
    }
}
