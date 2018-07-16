//
//  FIRDatabaseService.swift
//  MvvmDemoApp
//
//  Created by ashish on 01/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase


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
            completion(snapshot)
        })
    }
    
    func post(parameter : [String : Any] , to databaseReference : FIRDatabaseReference) {
        self.reference(databaseReference).childByAutoId().setValue(parameter)
    }
    
    func uploadFileToDatabaseStorage(with data : Data , andWith imageMetaData : Any?,completion : @escaping (String?,Error?) -> (Void)){
        
        var metaData : StorageMetadata?
        
        if let  imageMetaData = imageMetaData as? [String:String] {
            metaData = StorageMetadata()
            metaData?.setValue(imageMetaData["name"], forKey: "name")
            metaData?.contentType = imageMetaData["content-type"]
        }
        
        let storagereRef = Storage.storage().reference()
        let imageRef = storagereRef.child((metaData?.name)!)
        
        imageRef.putData(data, metadata: metaData ?? nil) { (metaData, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil,error)
                return
            }
            
            if let _ = metaData {
                imageRef.downloadURL(completion: { (url, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        completion(nil,error)
                    }else {
                        guard let downloadURl = url else {return}
                        completion(downloadURl.absoluteString,nil)
                    }
                })
            }
        }
    }
   
    func downloadFileFromDatabase(with name : String , completion : @escaping (Data?,Error?) -> (Void)){
        let storageRef = Storage.storage().reference()
        let userRef = storageRef.child(name)
        
        userRef.getData(maxSize: 1024*1024*1024) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil,error)
            }else{
                completion(data,nil)
            }
        }
    }
    
}



