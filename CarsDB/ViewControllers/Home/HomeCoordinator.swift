//
//  HomeCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/19/23.
//

import Foundation
import UIKit

class HomeCoordinator: BaseCoordinator {
    private let viewModel: HomeViewModel
    var window: UIWindow?
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        
    }
    
    func startWithTab() -> UIViewController {
        let viewController = HomeViewController.instantiate()
        let vm = HomeViewModel()
        vm.coordinatorDelegate = self
        viewController.viewModel = vm
        navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.isHidden = true
        return navigationVC
    }
}

extension HomeCoordinator: HomeViewModelCoordinatorDelegate {
    func didTapOnRow(car: VehicleModel?) {
        let coordinator = SceneDelegate.container.resolve(CarDetailCoordinator.self)!
        coordinator.navigationVC = navigationVC
        coordinator.vehicle = car
        coordinator.start()
    }
    
    func didTapSignOut() {
        let coordinator = SceneDelegate.container.resolve(SignInCoordinator.self)!
        let navigation = BaseNavigationController()
        coordinator.navigationVC = navigation
        coordinator.window = window
        coordinator.start()
    }
}

