//
//  AccountViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/24/23.
//

import Foundation
import Firebase

protocol AccountViewModelCoordinatorDelegate: class {
    func didTapOnRow()
}

protocol AccountViewModelProtocol {
    var coordinatorDelegate: AccountViewModelCoordinatorDelegate? {get set}
    func didTapMenuAction()
}

class AccountViewModel: AccountViewModelProtocol {
    var coordinatorDelegate: AccountViewModelCoordinatorDelegate?
    let firebaseAuth = Auth.auth()
    
    func didTapMenuAction() {
        do {
            try self.firebaseAuth.signOut()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.coordinatorDelegate?.didTapOnRow()
            }
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
