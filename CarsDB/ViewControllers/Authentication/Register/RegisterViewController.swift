//
//  RegisterViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/19/23.
//

import Foundation
import UIKit

class RegisterViewController: BaseViewController, Storyboarded {
    
    static var storyboard = AppStoryboard.signIn
    var viewModel: RegisterViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backAction(_ sender: Any) {
        viewModel?.didTapBack()
    }
}
