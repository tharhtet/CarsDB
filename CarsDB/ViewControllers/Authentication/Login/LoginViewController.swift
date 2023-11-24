//
//  LoginViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/18/23.
//

import Foundation
import UIKit

class LoginViewController: BaseViewController, Storyboarded {
    @IBOutlet weak var loginButton: UIButton!
    
    
    static var storyboard = AppStoryboard.signIn
    var viewModel: LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        //viewModel?.didTapLogin()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        viewModel?.didTapLogin(email: "a@gmail.com", password: "password")
    }
}
