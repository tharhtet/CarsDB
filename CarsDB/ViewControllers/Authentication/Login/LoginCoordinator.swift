//
//  LoginCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/18/23.
//

import Foundation
import UIKit

import UIKit

class LoginCoordinator: BaseCoordinator {
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        //self.navigationVC = navigationController
    }
    
    override func start() {
        let viewController = LoginViewController.instantiate()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        //navigationVC.isNavigationBarHidden = false
        navigationVC.pushViewController(viewController, animated: true)
    }

}


extension LoginCoordinator: LoginViewModelCoordinatorDelegate{
    func didTapOnRow() {
        navigationVC.popViewController(animated: true)
    }
}
