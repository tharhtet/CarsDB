//
//  ErrorAlertViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 12/8/23.
//

import Foundation

protocol ErrorAlertViewModelCoordinatorDelegate: class {
    func didTapOnRow()
}

protocol ErrorAlertViewModelProtocol {
    var coordinatorDelegate: ErrorAlertViewModelCoordinatorDelegate? {get set}
}

class ErrorAlertViewModel: ErrorAlertViewModelProtocol {
    var coordinatorDelegate: ErrorAlertViewModelCoordinatorDelegate?
}
