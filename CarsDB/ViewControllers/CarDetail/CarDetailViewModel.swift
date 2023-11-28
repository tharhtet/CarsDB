//
//  CarDetailViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/23/23.
//

import Foundation

protocol CarDetailViewModelCoordinatorDelegate: class {
    func didTapOnRow()
    func didTapBackAction()
}

protocol CarDetailViewModelProtocol {
    var coordinatorDelegate: CarDetailViewModelCoordinatorDelegate? {get set}
    
    func didTapBackAction()
}

class CarDetailViewModel: CarDetailViewModelProtocol {
    var coordinatorDelegate: CarDetailViewModelCoordinatorDelegate?
    var vehicle: VehicleModel?
    
    func didTapBackAction() {
        coordinatorDelegate?.didTapBackAction()
    }
}
