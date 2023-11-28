//
//  DetailSliderCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/24/23.
//

import Foundation
import UIKit

class DetailSliderCoordinator: BaseCoordinator {
    private let viewModel: DetailSliderViewModel
    var vehicle: VehicleModel?
    var window: UIWindow?
    
    init(viewModel: DetailSliderViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        
    }

}


extension DetailSliderCoordinator: DetailSliderViewModelCoordinatorDelegate {
    func didTapOnRow() {
        
    }
}
