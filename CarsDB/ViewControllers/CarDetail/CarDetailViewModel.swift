//
//  CarDetailViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/23/23.
//

import Foundation

protocol CarDetailViewModelCoordinatorDelegate: class {
    func didTapOnRow()
}

protocol CarDetailViewModelProtocol {
    var coordinatorDelegate: CarDetailViewModelCoordinatorDelegate? {get set}
}

class CarDetailViewModel: CarDetailViewModelProtocol {
    var coordinatorDelegate: CarDetailViewModelCoordinatorDelegate?
}
