//
//  FirebaseNotificationService.swift
//  MvvmDemoApp
//
//  Created by ashish on 02/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
import FirebaseMessaging

enum SubscriptionTopic : String {
    case userList = "userList"
    
    init?(string : String){
        switch string {
        case "userList":
            self = .userList
        default:
            return nil
        }
    }
}


class FIRNotificationService {
    
    private init(){}
    
    public private(set) static var instance = FIRNotificationService()
    
    func subscribe(to topic : SubscriptionTopic){
        Messaging.messaging().subscribe(toTopic: topic.rawValue)
    }
    
    func unSubscribe(from topic : SubscriptionTopic){
        Messaging.messaging().unsubscribe(fromTopic: topic.rawValue)
    }
    
}
