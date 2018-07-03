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
    
    func singIn(userName : String?,password : String? , completion :@escaping (Bool,String?) -> Void){
        if let userName = userName , let password = password , !userName.isEmpty,!password.isEmpty{
            Auth.auth().signIn(withEmail: userName, password: password,  completion: {  (user, error) in
                if let error = error {
                    print(error);
                    completion(false,error.localizedDescription);
                }else{
                    if user != nil {
                        completion(true,nil);
                    }else{
                        completion(false,"ErrorMessages.unSuccessfullSignIn");
                    }
                }
            })
        }else{
            completion(false,"Please Enter a Username and password");
        }
    }
    
    func signInWith(credentials : AuthCredential ,completion :@escaping (Bool,String?) -> Void){
        
        Auth.auth().signInAndRetrieveData(with: credentials) { (user, error) in
            if let error = error {
                print(error);
                completion(false,error.localizedDescription);
            }else{
                if user != nil {
                    completion(true,nil);
                }else{
                    completion(false,"ErrorMessages.unSuccessfullSignIn");
                }
            }
        }
    }
    
    func registerUser(userName : String?,password : String? , completetion : @escaping (Bool,String?) -> Void){
        if let userName = userName , let password = password , !userName.isEmpty,!password.isEmpty {
            Auth.auth().createUser(withEmail: userName, password: password, completion: {
                (user,error) in
                
                if let error = error {
                    print(error)
                    completetion(false,error.localizedDescription)
                }else{
                    if user != nil {
                        print("ErrorMessages.successfullRegistered");
                        completetion(true,nil)
                    }else{
                        print("ErrorMessages.unSuccessfullRegistered");
                        completetion(false,"ErrorMessages.unSuccessfullRegistered")
                    }
                }
            })
        }
    }
    
    func signOut(completion : @escaping (Bool,String?) -> Void){
        
        DispatchQueue.global(qos: .background).async {
            do{
                try Auth.auth().signOut();
                completion(true,nil)
            }catch{
                completion(true,"ErrorMessages.unSuccessfullSignOut");
            }
        }
    }
}
