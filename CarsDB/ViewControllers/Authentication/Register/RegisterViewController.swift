//
//  RegisterViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/19/23.
//

import Foundation
import UIKit

class RegisterViewController: BaseViewController, Storyboarded {
    @IBOutlet weak var nextButton: UIButton!
    
    static var storyboard = AppStoryboard.signIn
    var viewModel: RegisterViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    private func configUI() {
        nextButton.layer.cornerRadius = 8
    }
    
    @IBAction func backAction(_ sender: Any) {
        viewModel?.didTapBack()
    }
}
