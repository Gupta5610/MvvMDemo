//
//  LoginVC.swift
//  MvvmDemoApp
//
//  Created by ashish on 27/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    private var loginViewModel : LoginViewModel!
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    @IBOutlet weak var emailTextField: BindingUITextField!{
        didSet{
            emailTextField.bind({
                self.loginViewModel.email.value = $0
            })
        }
    }
    
    @IBOutlet weak var passwordTextField: BindingUITextField!{
        didSet{
            passwordTextField.bind({
                self.loginViewModel.password.value = $0
            })
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginViewModel = LoginViewModel(authenticationService: AuthenticationService.instance)
        self.activityIndicator.isHidden = true;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loginViewModel.email.bind(completetion: {
            self.emailTextField.text = $0
        })
        
        self.loginViewModel.password.bind(completetion: {
            self.passwordTextField.text = $0
        })
        
        self.loginViewModel.errorMessage.bind(completetion: {
            self.errorMessageLabel.text = $0
        })
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        self.view.isUserInteractionEnabled = false
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        
        self.loginViewModel.logIn(completion: {

            isValid,errorCode in
            
            
            if !isValid{
              self.textFieldErrorUI(registrationErrorCode: errorCode!)
            }else{
                
                self.performSegue(withIdentifier: "LoginVCtoUserListVC", sender: nil)
                //self.present(UserListVC, animated: true, completion: nil)
            }
            
            self.errorMessageLabel.isHidden = isValid
            self.view.isUserInteractionEnabled = true
            self.activityIndicator.isHidden = true
            
        })
    }
    
    
    @IBAction func registerBtnPressed(_ sender: Any) {
        let registrationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationVC")
        self.present(registrationVC, animated: true, completion: nil);
        
    }
    
}

extension LoginVC {
    func textFieldErrorUI(registrationErrorCode : LoginErrorCode){
        switch registrationErrorCode {
        case .InvalidEmailFormat:
            self.emailTextField.ErrorShake()
        case .InvalidPasswordFormat:
            self.passwordTextField.ErrorShake()
        case.InvalidEmailandPassword:
            self.errorMessageLabel.isHidden = true
            self.present(AlertControllerService.createAlertViewController(errorMessage: ErrorMessages.InvalidEmailandPassword), animated: true, completion: nil)
        }
    }
}
