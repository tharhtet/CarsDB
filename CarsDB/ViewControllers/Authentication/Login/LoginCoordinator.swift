//
//  LoginCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/18/23.
//

import Foundation
import UIKit

class LoginCoordinator: BaseCoordinator {
    private let viewModel: LoginViewModel
    var window: UIWindow?
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = LoginViewController.instantiate()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        navigationVC.present(viewController, animated: true)
    }

}


extension LoginCoordinator: LoginViewModelCoordinatorDelegate{
    func didTapOnRow() {
        let coordinator = SceneDelegate.container.resolve(MainTabCoordinator.self)!
        let navigation = BaseNavigationController()
        coordinator.navigationVC = navigation
        coordinator.window = window
        start(coordinator: coordinator)
    }
}
