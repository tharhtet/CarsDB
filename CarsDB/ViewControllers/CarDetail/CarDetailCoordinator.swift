//
//  CarDetailCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/23/23.
//

import Foundation
import UIKit

class CarDetailCoordinator: BaseCoordinator {
    private let viewModel: CarDetailViewModel
    var vehicle: VehicleModel?
    var window: UIWindow?
    
    init(viewModel: CarDetailViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = CarDetailViewController.instantiate()
        viewModel.coordinatorDelegate = self
        if let vehicle = vehicle {
            viewModel.vehicle = vehicle
        }
        
        viewController.viewModel = viewModel
        navigationVC.pushViewController(viewController, animated: true)
    }

}


extension CarDetailCoordinator: CarDetailViewModelCoordinatorDelegate {
    func didTapOnRow() {
//        let coordinator = SceneDelegate.container.resolve(MainTabCoordinator.self)!
//        let navigation = BaseNavigationController()
//        coordinator.navigationVC = navigation
//        coordinator.window = window
//        start(coordinator: coordinator)
    }
    
    func didTapBackAction() {
        self.navigationVC.popViewController(animated: true)
    }
}
