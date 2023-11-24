//
//  HomeViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/19/23.
//

import Foundation
import FirebaseAuth

protocol HomeViewModelCoordinatorDelegate: class {
    func didTapOnRow(car: VehicleModel?)
    func didTapSignOut()
}

protocol HomeViewModelProtocol {
    var coordinatorDelegate: HomeViewModelCoordinatorDelegate?{get set}
    
    func getAnimeList(response : @escaping([VehicleModel])->())
    func didDetailActionByIndex(car: VehicleModel?)
    func didTapMenuAction()
}

class HomeViewModel: HomeViewModelProtocol {
    var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
    let firebaseAuth = Auth.auth()

    func getAnimeList(response: @escaping ([VehicleModel]) -> ()) {
        CarServices.shared.fetchCarLists { result in
            response(result)
        }
    }
    
    func didDetailActionByIndex(car: VehicleModel?) {
        coordinatorDelegate?.didTapOnRow(car: car)
    }
    
    func didTapMenuAction() {
        do {
            try self.firebaseAuth.signOut()
            coordinatorDelegate?.didTapSignOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
