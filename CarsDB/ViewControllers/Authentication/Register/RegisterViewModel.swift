//
//  RegisterViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/19/23.
//

import Foundation

protocol RegisterViewModelCoordinatorDelegate: class {
    func didTapOnRow()
}

protocol RegisterViewModelProtocol {
    var coordinatorDelegate: RegisterViewModelCoordinatorDelegate?{get set}
//    func skipOnboarding()
}

class RegisterViewModel: RegisterViewModelProtocol {
    weak var coordinatorDelegate: RegisterViewModelCoordinatorDelegate?
    
    func didTapBack() {
        self.coordinatorDelegate?.didTapOnRow()
    }
}
