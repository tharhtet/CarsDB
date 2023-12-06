//
//  LoginViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/18/23.
//

import Foundation
import UIKit
import AuthenticationServices
import FBSDKLoginKit
import MBProgressHUD

class LoginViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var viewAppleSignIn: UIView!
    @IBOutlet weak var fbLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: LeftAlignedIconButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    static var storyboard = AppStoryboard.signIn
    var viewModel: LoginViewModel?
    var appleLogInButton : ASAuthorizationAppleIDButton = {
        let button = ASAuthorizationAppleIDButton()
        button.addTarget(self, action: #selector(signInWithApple(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    private func configUI() {
        loginButton.layer.cornerRadius = 8
        fbLoginButton.layer.cornerRadius = 8
        viewAppleSignIn.layer.cornerRadius = 8
        googleLoginButton.layer.borderWidth = 1
        googleLoginButton.layer.borderColor = UIColor.lightGray.cgColor
        googleLoginButton.layer.cornerRadius = 8
        appleLogInButton.frame = CGRect(x: 0, y: 0, width: self.viewAppleSignIn.frame.width, height: 54)
        viewAppleSignIn.addSubview(appleLogInButton)
        
//        fbLoginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
    }
    
    func showAlertError() {
        let alert = UIAlertController(title: "Login error", message: "Please correct the user information for login.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        //viewModel?.didTapLogin()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            if email == "" || password == "" || !Validation.shared.isValidEmailAddress(emailAddressString: email) {
                showAlertError()
                return
            }
            MBProgressHUD.showAdded(to: self.view, animated: true)
            viewModel?.didTapLogin(email: email, password: password, completion: { flag in
                MBProgressHUD.hide(for: self.view, animated: true)
                if !flag {
                    self.showAlertError()
                }
            })
        }
    }
    
    @objc func signInWithApple(_ sender: Any) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
               let request = appleIDProvider.createRequest()
               request.requestedScopes = [.fullName, .email]
               let authorizationController = ASAuthorizationController(authorizationRequests: [request])
               authorizationController.delegate = self
               authorizationController.performRequests()
    }
    
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile"], from: self) { result, error in
            if let error = error {
                print("Encountered Erorr: \(error)")
            } else if let result = result, result.isCancelled {
                print("Cancelled")
            } else {
                print("Logged In")
            }
        }
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate, LoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
        
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            print(userIdentifier)
            print(fullName)
            print(email)
        }
    }
          
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
    }
}
