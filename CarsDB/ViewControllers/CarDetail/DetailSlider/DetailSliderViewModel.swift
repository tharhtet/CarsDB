//
//  DetailSliderViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/24/23.
//

import Foundation

protocol DetailSliderViewModelCoordinatorDelegate: class {
    func didTapOnRow()
}

protocol DetailSliderViewModelProtocol {
    var coordinatorDelegate: DetailSliderViewModelCoordinatorDelegate? {get set}
}

class DetailSliderViewModel: DetailSliderViewModelProtocol {
    var coordinatorDelegate: DetailSliderViewModelCoordinatorDelegate?
    var vehicle: VehicleModel?
}
