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
    var view1: UITabBarController?
    var window: UIWindow?
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = HomeViewController.instantiate()
        let vm = HomeViewModel()
        vm.coordinatorDelegate = self
        viewController.viewModel = vm
        //view1?.viewControllers = [viewController]
    }
    
    func start1() -> UIViewController {
        let viewController = HomeViewController.instantiate()
        let vm = HomeViewModel()
        vm.coordinatorDelegate = self
        viewController.viewModel = vm
        return viewController
    }
}

extension HomeCoordinator: HomeViewModelCoordinatorDelegate {
    func didTapOnRow(car: VehicleModel?) {
        let coordinator = SceneDelegate.container.resolve(CarDetailCoordinator.self)!
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

