//
//  HomeViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/19/23.
//

import Foundation

protocol HomeViewModelCoordinatorDelegate: class {
    func didTapOnRow()
}

protocol HomeViewModelProtocol {
    var coordinatorDelegate: HomeViewModelCoordinatorDelegate?{get set}
    
    func getAnimeList(response : @escaping([VehicleModel])->())
}

class HomeViewModel: HomeViewModelProtocol {
    weak var coordinatorDelegate: HomeViewModelCoordinatorDelegate?

    func getAnimeList(response: @escaping ([VehicleModel]) -> ()) {
        CarServices.shared.fetchCarLists { result in
            response(result)
        }
    }
}
