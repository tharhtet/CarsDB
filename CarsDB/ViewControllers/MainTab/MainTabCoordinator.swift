//
//  MainTabCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/20/23.
//

import Foundation
import UIKit

class MainTabCoordinator: BaseCoordinator {
    
    private let viewModel: MainTabViewModel
    var window: UIWindow?
    var tabBarController: UITabBarController?
    
    init(window: UIWindow?, viewModel: MainTabViewModel) {
        self.viewModel = viewModel
        self.window = window
    }
    
    override func start() {
        let viewController = MainTabViewController.instantiate()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        
        let coordinator = SceneDelegate.container.resolve(HomeCoordinator.self)!
        coordinator.window = window
        let vc1 = coordinator.start1()
        viewController.viewControllers = [vc1]
        
        navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.isHidden = true
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        self.windowRootAnimation(window: window)
    }
}

extension MainTabCoordinator: MainTabViewModelCoordinatorDelegate {
    func didTapOnRow() {
        let coordinator = SceneDelegate.container.resolve(HomeCoordinator.self)!
        coordinator.start()
    }
}
