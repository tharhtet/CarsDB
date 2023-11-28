//
//  SignInCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/18/23.
//

import Foundation
import UIKit

class SignInCoordinator: BaseCoordinator {
    private let viewModel: SignInViewModel
    var window: UIWindow?
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
    }
    
    override func start(window: UIWindow?) {
        let viewController = SignInViewController.instantiate()
        viewController.viewModel = viewModel
        navigationVC.viewControllers = [viewController]
    }
    override func start() {
        let viewController = SignInViewController.instantiate()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.isHidden = true
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        
        self.windowRootAnimation(window: window)
    }
}

extension SignInCoordinator: SignInViewModelCoordinatorDelegate {
    func registerAction() {
        let coordinator = SceneDelegate.container.resolve(RegisterCoordinator.self)!
        coordinator.navigationVC = self.navigationVC
        start(coordinator: coordinator)
    }
    
    func loginAction() {
        let coordinator = SceneDelegate.container.resolve(LoginCoordinator.self)!
        coordinator.navigationVC = self.navigationVC
        coordinator.window = self.window
        start(coordinator: coordinator)
    }
}
