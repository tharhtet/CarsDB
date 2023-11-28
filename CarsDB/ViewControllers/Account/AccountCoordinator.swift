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
        return viewController
    }
}


extension AccountCoordinator: AccountViewModelCoordinatorDelegate {
    func didTapOnRow() {
//        let coordinator = SceneDelegate.container.resolve(MainTabCoordinator.self)!
//        let navigation = BaseNavigationController()
//        coordinator.navigationVC = navigation
//        coordinator.window = window
//        start(coordinator: coordinator)
    }
}
