//
//  AccountViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/24/23.
//

import Foundation

protocol AccountViewModelCoordinatorDelegate: class {
    func didTapOnRow()
}

protocol AccountViewModelProtocol {
    var coordinatorDelegate: AccountViewModelCoordinatorDelegate? {get set}
}

class AccountViewModel: AccountViewModelProtocol {
    var coordinatorDelegate: AccountViewModelCoordinatorDelegate?
}
