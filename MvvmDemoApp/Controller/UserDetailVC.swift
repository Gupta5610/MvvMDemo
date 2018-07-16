//
//  UserDetailVC.swift
//  MvvmDemoApp
//
//  Created by ashish on 15/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import UIKit

class UserDetailVC: UIViewController  {

    
    @IBOutlet weak var userImageView : UIImageView!
    @IBOutlet weak var activityIndicatorView : UIActivityIndicatorView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var phoneNumberLabel : UILabel!
    
  
    
    var userDetailViewModel : UserDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.userDetailViewModel.delegate = self
        self.userDetailViewModel.inject(dataService: DataService.instance)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.activityIndicatorView.startAnimating()
        self.activityIndicatorView.isHidden = false
        
        self.userDetailViewModel.loadData(completion : {
            self.activityIndicatorView.stopAnimating()
            self.activityIndicatorView.isHidden = true
        })
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        print("Button Pressed")
    }
}




extension UserDetailVC :  UserDetailViewDelegate {
    func updateEmailLabelWith(value: String) {
        self.nameLabel.text = value
    }
    
    func updatePhoneNumberLabelWith(value: String) {
        self.phoneNumberLabel.text = value
    }
    
    func updateImageWith(data : Data){
        self.userImageView.image = UIImage(data: data)
    }
}
