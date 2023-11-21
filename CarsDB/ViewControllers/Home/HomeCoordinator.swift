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
        let viewController = HomeViewController.instantiate()
        //viewModel.coordinatorDelegate = self
        viewController.viewModel = HomeViewModel()
        //navigationController.viewControllers = [viewController]
//        navigationVC = UINavigationController(rootViewController: viewController)
//        //navigationVC.isNavigationBarHidden = true
//        navigationVC.navigationBar.isHidden = true
//        window?.rootViewController = navigationVC
//        window?.makeKeyAndVisible()
    }

}
