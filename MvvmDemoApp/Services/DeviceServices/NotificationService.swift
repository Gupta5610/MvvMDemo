//
//  NotificationService.swift
//  MvvmDemoApp
//
//  Created by ashish on 01/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class NotificationService : NSObject {
    
    
    public private(set) static var instance = NotificationService()
    
    var notificationCenter = UNUserNotificationCenter.current()
    
    static func authorize(){
        instance.authorize()
    }
    
    func authorize(){
        notificationCenter.requestAuthorization(options: [.alert,.sound,.badge]) { (permissionGranted, error) in
            if permissionGranted {
                DispatchQueue.main.async {
                    print(permissionGranted)
                    self.configure()
                }
            }else {
                guard let error = error else { return }
                print(error.localizedDescription)
            }
        }
    }
    
    func configure(){
        notificationCenter.delegate = self
        UIApplication.shared.registerForRemoteNotifications()
        WebService.instance.subscribeNotification(to: "userList")
    }
}

extension NotificationService : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert,.badge,.sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
