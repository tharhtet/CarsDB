//
//  ConfirmViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 12/8/23.
//

import Foundation

protocol ConfirmViewModelCoordinatorDelegate: class {
    func didTapOnRow()
}

protocol ConfirmViewModelProtocol {
    var coordinatorDelegate: ConfirmViewModelCoordinatorDelegate? {get set}
}

class ConfirmViewModel: ConfirmViewModelProtocol {
    var coordinatorDelegate: ConfirmViewModelCoordinatorDelegate?
}
