//
//  FIRDatabaseService.swift
//  MvvmDemoApp
//
//  Created by ashish on 01/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
import FirebaseDatabase

enum FIRDatabaseReference :String {
    case user = "users"
    
    init?(with value: String){
        switch value {
        case "users":
            self = .user
        default: return nil
        }
    }
}

class FIRDatabaseService {
    
    public private(set) static var instance = FIRDatabaseService()
    
    func reference(_ databaseReference : FIRDatabaseReference) -> DatabaseReference {
        return Database.database().reference().child(databaseReference.rawValue)
    }
    
    func observe(_ databaseReference : FIRDatabaseReference,completion : @escaping (DataSnapshot?) -> (Void)){
        
        self.reference(databaseReference).observe(.value, with: {
            snapshot in
            print(snapshot.value)
            completion(snapshot)
        })
    }
    
    func post(parameter : [String : Any] , to databaseReference : FIRDatabaseReference) {
        self.reference(databaseReference).childByAutoId().setValue(parameter)
    }
}
