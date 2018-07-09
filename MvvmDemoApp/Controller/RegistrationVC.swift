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
                self.registrationViewModel.userEmail = $0
            }
        }
    }
    
    @IBOutlet weak var numberTextField: BindingUITextField!{
        didSet{
            numberTextField.bind({
                self.registrationViewModel.phoneNumber = $0
            })
        }
    }
    
    @IBOutlet weak var passwordTextField: BindingUITextField!{
        didSet{
            passwordTextField.bind({
                self.registrationViewModel.password = $0
            })
        }
    }
    
    
    @IBOutlet weak var repeatpasswordTextField: BindingUITextField!{
        didSet{
            repeatpasswordTextField.bind({
                self.registrationViewModel.repeatPassword = $0
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
        self.registrationViewModel.delegate = self
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


extension RegistrationVC : RegistrationVCProtocol {
    func updatePhoneNumberTextField(with number: String) {
        self.numberTextField.text = number
    }
    
    func updateRepeatPasswordTextField(with password: String) {
        self.repeatpasswordTextField.text = password
    }
    
    func updateEmailTextField(with email: String) {
        self.emailTextField.text = email
    }
    
    func updatePasswordTextFeild(with password: String) {
        self.passwordTextField.text = password
    }
    
    func updateErrorLabel(with errorMessage: String) {
        self.errorMessageLabel.text = errorMessage
    }
}

