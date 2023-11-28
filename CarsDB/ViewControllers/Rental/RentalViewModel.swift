//
//  RentalViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/24/23.
//

import Foundation

protocol RentalViewModelCoordinatorDelegate: class {
    func didTapOnRow()
}

protocol RentalViewModelProtocol {
    var coordinatorDelegate: RentalViewModelCoordinatorDelegate? {get set}
}

class RentalViewModel: RentalViewModelProtocol {
    var coordinatorDelegate: RentalViewModelCoordinatorDelegate?
}
