//
//  LoginViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/18/23.
//

import Foundation
import UIKit

class LoginViewController: BaseViewController, Storyboarded {
    
    
    static var storyboard = AppStoryboard.signIn
    var viewModel: LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        viewModel?.didTapBack()
    }
    
}
