//
//  ViewController.swift
//  MvvmDemoApp
//
//  Created by ashish on 26/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {
    
    

    @IBOutlet weak var emailTextField: BindingUITextField!{
        didSet{
            emailTextField.bind {
                self.registrationViewModel.userEmail.value = $0
            }
        }
    }
    
    @IBOutlet weak var numberTextField: BindingUITextField!{
        didSet{
            numberTextField.bind({
                self.registrationViewModel.phoneNumber.value = $0
            })
        }
    }
    
    @IBOutlet weak var passwordTextField: BindingUITextField!{
        didSet{
            passwordTextField.bind({
                self.registrationViewModel.password.value = $0
            })
        }
    }
    
    
    @IBOutlet weak var repeatpasswordTextField: BindingUITextField!{
        didSet{
            repeatpasswordTextField.bind({
                self.registrationViewModel.repeatPassword.value = $0
            })
        }
    }
    
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    var registrationViewModel : RegistrationViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registrationViewModel = RegistrationViewModel(registrationService: RegistrationService.instance)
        self.activityIndicator.isHidden = true;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.registrationViewModel.errorMessage.bind(completetion: {
            self.errorMessageLabel.text = $0
        })
        
        self.registrationViewModel.password.bind(completetion: {
            self.passwordTextField.text = $0
        })
        
        self.registrationViewModel.repeatPassword.bind(completetion: {
            self.repeatpasswordTextField.text = $0
        })
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
      self.view.isUserInteractionEnabled = false
      self.activityIndicator.isHidden = false
        
        self.registrationViewModel.save(compeletion: {
            isValid,errorCode in
            if isValid {
                self.backBtnPressed(self)
            }else{
              //  self.textFieldErrorUI(registrationErrorCode: errorCode!)
            }
            self.errorMessageLabel.isHidden = isValid
            self.view.isUserInteractionEnabled = true
            self.activityIndicator.isHidden = true
            
        })
        
    }
   
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func textFieldErrorUI(registrationErrorCode : RegistrationErrorCode){
        switch registrationErrorCode {
        case .InvalidEmail:
            self.emailTextField.ErrorShake()
        case .InvalidPassword:
            self.passwordTextField.ErrorShake()
        case.InvalidPhoneNumber:
            self.numberTextField.ErrorShake()
        case.PasswordMatch:
            self.passwordTextField.ErrorShake()
            self.repeatpasswordTextField.ErrorShake()
        }
    }
    
    
}

