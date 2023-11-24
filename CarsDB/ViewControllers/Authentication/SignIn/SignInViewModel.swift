//
//  SignInViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/18/23.
//

import Foundation

protocol SignInViewModelCoordinatorDelegate: class {
    func registerAction()
    func loginAction()
}

protocol SignInViewModelProtocol {
    var coordinatorDelegate: SignInViewModelCoordinatorDelegate? {get set}
}

class SignInViewModel: SignInViewModelProtocol {
    var coordinatorDelegate: SignInViewModelCoordinatorDelegate?
    
    func didTapOnRegister() {
        coordinatorDelegate?.registerAction()
    }
    
    func didTapOnLogin() {
        print(coordinatorDelegate)
        coordinatorDelegate?.loginAction()
    }
}
