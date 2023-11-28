//
//  RentalCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/24/23.
//

import Foundation
import UIKit

class RentalCoordinator: BaseCoordinator {
    private let viewModel: RentalViewModel
    
    init(viewModel: RentalViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        
    }

    func startWithTab() -> UIViewController {
        let viewController = RentalViewController.instantiate()
        let vm = RentalViewModel()
        vm.coordinatorDelegate = self
        viewController.viewModel = vm
        return viewController
    }
}


extension RentalCoordinator: RentalViewModelCoordinatorDelegate{
    func didTapOnRow() {
//        let coordinator = SceneDelegate.container.resolve(MainTabCoordinator.self)!
//        let navigation = BaseNavigationController()
//        coordinator.navigationVC = navigation
//        coordinator.window = window
//        start(coordinator: coordinator)
    }
}
