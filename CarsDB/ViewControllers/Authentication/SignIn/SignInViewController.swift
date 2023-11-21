//
//  SignInViewController.swift.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/18/23.
//

import Foundation
import UIKit
import Lottie

class SignInViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    static var storyboard = AppStoryboard.signIn
    var viewModel: SignInViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configUI()
        self.setUpBindings()
    }
    
    private func configUI() {
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
        
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.cornerRadius = 12
        registerButton.layer.cornerRadius = 12
        
    }
    
    private func setUpBindings() {
        guard let viewModel = viewModel else { return }
    }
    
    @IBAction func registerAction(_ sender: Any) {
        viewModel?.didTapOnRegister()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        viewModel?.didTapOnLogin()
    }
}
