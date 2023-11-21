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
        viewController.viewModel = viewModel
        navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.isHidden = true
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        self.windowRootAnimation(window: window)
        
        
        let coordinator = SceneDelegate.container.resolve(HomeCoordinator.self)!
        coordinator.start()
    }

}
