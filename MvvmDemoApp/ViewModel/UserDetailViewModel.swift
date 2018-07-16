//
//  UserDetailViewModel.swift
//  MvvmDemoApp
//
//  Created by ashish on 15/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

class UserDetailViewModel {
    
    var userEmail : String!
    var userPhoneNumber : String!
    
    var imageData : Data!{
        didSet{
            DispatchQueue.main.async {
                self.delegate?.updateImageWith(data: self.imageData)
            }
        }
    }
    
    
    var dataService : DataServiceProtocol?
    var delegate : UserDetailViewDelegate?
    
    
    init(email : String , phoneNumber : String) {
        self.userEmail = email
        self.userPhoneNumber = phoneNumber
    }
    
    init(dataService : DataServiceProtocol) {
        self.dataService = dataService
    }
    
    func inject(dataService : DataServiceProtocol){
        self.dataService = dataService
    }
    
    func loadData(completion : @escaping () -> (Void)){
        
        DispatchQueue.main.async {
            self.delegate?.updatePhoneNumberLabelWith(value: self.userPhoneNumber)
            self.delegate?.updateEmailLabelWith(value: self.userEmail)
        }
        
        self.dataService?.getImageDataForUserWith(email: self.userEmail, completion: { (data, error) -> (Void) in
            if error == nil {
                self.imageData = data!
                completion()
            }
        })
        
    }
    
    
}
