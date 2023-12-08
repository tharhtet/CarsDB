//
//  ErrorAlertCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 12/8/23.
//

import Foundation
import UIKit

class ErrorAlertCoordinator: BaseCoordinator {
    private let viewModel: ErrorAlertViewModel
    var window: UIWindow?
    
    init(viewModel: ErrorAlertViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        
    }
}


extension ErrorAlertCoordinator: ErrorAlertViewModelCoordinatorDelegate {
    func didTapOnRow() {
        
    }
}
