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
    
    func didTapLogin(email: String?, password: String?)
}

class LoginViewModel: LoginViewModelProtocol {
    var coordinatorDelegate: LoginViewModelCoordinatorDelegate?
    
    func didTapLogin(email: String?, password: String?) {
        if let email = email, password == password {
            if Validation.shared.isValidEmailAddress(emailAddressString: email) {
                
                Auth.auth().signIn(withEmail: email, password: password ?? "") { [weak self] authResult, error in
                    guard let strongSelf = self else { return }
                    
                    strongSelf.coordinatorDelegate?.didTapOnRow()
                }
            } else {
                print("isFalse")
            }
        }
    }
}
