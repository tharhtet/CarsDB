//
//  LoginViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/18/23.
//

import Foundation

protocol LoginViewModelCoordinatorDelegate: class {
    func didTapOnRow()
}

protocol LoginViewModelProtocol {
    var coordinatorDelegate: LoginViewModelCoordinatorDelegate? {get set}
}

class LoginViewModel: LoginViewModelProtocol {
    var coordinatorDelegate: LoginViewModelCoordinatorDelegate?
    
    func didTapBack() {
        coordinatorDelegate?.didTapOnRow()
    }
}
