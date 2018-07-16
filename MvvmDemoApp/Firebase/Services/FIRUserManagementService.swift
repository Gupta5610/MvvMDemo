//
//  FIRUserManagementService.swift
//  MvvmDemoApp
//
//  Created by ashish on 01/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation
import FirebaseAuth

class FIRUsermanagementService {
    
    public private(set) static var instance = FIRUsermanagementService()
    
    func singIn(userName : String?,password : String? , completion :@escaping (Bool,Error?) -> Void){
        if let userName = userName , let password = password , !userName.isEmpty,!password.isEmpty{
            Auth.auth().signIn(withEmail: userName, password: password,  completion: {  (user, error) in
                if let error = error {
                    print(error);
                    completion(false,error);
                }else{
                    if user != nil {
                        completion(true,nil);
                    }else{
                        completion(false,error);
                    }
                }
            })
        }else{
            completion(false,nil);
        }
    }
    
    func signInWith(credentials : AuthCredential ,completion :@escaping (Bool,Error?) -> Void){
        
        Auth.auth().signInAndRetrieveData(with: credentials) { (user, error) in
            if let error = error {
                print(error);
                completion(false,error);
            }else{
                if user != nil {
                    completion(true,error);
                }else{
                    completion(false,error);
                }
            }
        }
    }
    
    func registerUser(userName : String?,password : String? , completetion : @escaping (Bool,Error?) -> Void){
        if let userName = userName , let password = password , !userName.isEmpty,!password.isEmpty {
            Auth.auth().createUser(withEmail: userName, password: password, completion: {
                (user,error) in
                
                if let error = error {
                    print(error)
                    completetion(false,error)
                }else{
                    if user != nil {
                        completetion(true,error)
                    }else{
                        completetion(false,error)
                    }
                }
            })
        }
    }
    
    func signOut(completion : @escaping (Bool,Error?) -> Void){
        
        DispatchQueue.global(qos: .background).async {
            do{
                try Auth.auth().signOut();
                completion(true,nil)
            }catch{
                completion(false,error);
            }
        }
    }
}
