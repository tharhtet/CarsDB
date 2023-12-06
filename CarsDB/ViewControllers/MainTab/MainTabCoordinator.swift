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
    
    init(window: UIWindow?, viewModel: MainTabViewModel) {
        self.viewModel = viewModel
        self.window = window
    }
    
    override func start() {
        let viewController = MainTabViewController.instantiate()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        
        let homeCoordinator = SceneDelegate.container.resolve(HomeCoordinator.self)!
        homeCoordinator.window = window
        homeCoordinator.navigationVC = self.navigationVC
        let homeVC = homeCoordinator.startWithTab()
        
        let rentalCoordinator = SceneDelegate.container.resolve(RentalCoordinator.self)!
        //rentalCoordinator.window = window
        rentalCoordinator.navigationVC = self.navigationVC
        let rentalVC = rentalCoordinator.startWithTab()
        
        let accountCoordinator = SceneDelegate.container.resolve(AccountCoordinator.self)!
        accountCoordinator.window = window
        let accountVC = accountCoordinator.startWithTab()
        
        viewController.viewControllers = [homeVC, rentalVC, accountVC]
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        self.windowRootAnimation(window: window)
    }
}

extension MainTabCoordinator: MainTabViewModelCoordinatorDelegate {
    func didTapOnRow() {
        
    }
}
