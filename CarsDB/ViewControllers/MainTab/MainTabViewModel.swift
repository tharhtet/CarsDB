//
//  MainTabViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/20/23.
//

import Foundation

protocol MainTabViewModelCoordinatorDelegate: class {
    func didTapOnRow()
}

protocol MainTabViewModelProtocol {
    var coordinatorDelegate: MainTabViewModelCoordinatorDelegate?{get set}
    func initialize()
}

class MainTabViewModel: MainTabViewModelProtocol {
    weak var coordinatorDelegate: MainTabViewModelCoordinatorDelegate?
    
    func initialize() {
        coordinatorDelegate?.didTapOnRow()
    }
}
