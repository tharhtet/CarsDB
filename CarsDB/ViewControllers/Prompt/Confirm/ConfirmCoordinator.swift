//
//  ConfirmCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 12/8/23.
//

import Foundation
import UIKit

class ConfirmCoordinator: BaseCoordinator {
    private let viewModel: ConfirmViewModel
    var window: UIWindow?
    
    init(viewModel: ConfirmViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        
    }
}


extension ConfirmCoordinator: ConfirmViewModelCoordinatorDelegate {
    func didTapOnRow() {
        
    }
}
