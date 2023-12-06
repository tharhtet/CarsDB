//
//  AccountCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/24/23.
//

import Foundation
import UIKit

class AccountCoordinator: BaseCoordinator {
    private let viewModel: AccountViewModel
    var window: UIWindow?
    
    init(viewModel: AccountViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        
    }

    func startWithTab() -> UIViewController {
        let viewController = AccountViewController.instantiate()
        let vm = AccountViewModel()
        vm.coordinatorDelegate = self
        viewController.viewModel = vm
        navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.isHidden = false
        return navigationVC
    }
}


extension AccountCoordinator: AccountViewModelCoordinatorDelegate {
    func didTapOnRow() {
        let coordinator = SceneDelegate.container.resolve(SignInCoordinator.self)!
        let navigation = BaseNavigationController()
        coordinator.navigationVC = navigation
        coordinator.window = window
        coordinator.start()
    }
}
