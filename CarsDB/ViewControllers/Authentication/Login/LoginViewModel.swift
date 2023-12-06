//
//  LoginViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/18/23.
//

import Foundation
import FirebaseAuth

protocol LoginViewModelCoordinatorDelegate: class {
    func didTapOnRow()
}

protocol LoginViewModelProtocol {
    var coordinatorDelegate: LoginViewModelCoordinatorDelegate? {get set}
    
    func didTapLogin(email: String, password: String, completion: @escaping (_ done: Bool) -> Void)
}

class LoginViewModel: LoginViewModelProtocol {
    var coordinatorDelegate: LoginViewModelCoordinatorDelegate?
    
    func didTapLogin(email: String, password: String, completion: @escaping (_ done: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            completion(error == nil)
            if error == nil {
                strongSelf.coordinatorDelegate?.didTapOnRow()
            }
        }
    }
}
