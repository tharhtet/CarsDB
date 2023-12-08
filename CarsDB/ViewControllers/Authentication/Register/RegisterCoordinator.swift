//
//  RegisterCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/19/23.
//

import Foundation
import UIKit

class RegisterCoordinator: BaseCoordinator {
    private let viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = RegisterViewController.instantiate()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        navigationVC.present(viewController, animated: true)
    }
}

extension RegisterCoordinator: RegisterViewModelCoordinatorDelegate {
    func didTapOnRow() {
        navigationVC.dismiss(animated: true)
    }
}
