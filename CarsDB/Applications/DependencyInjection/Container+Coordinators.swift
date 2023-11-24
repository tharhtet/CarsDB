//
//  Container+Coordinators.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/16/23.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    func registerCoordinators() {
        autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        autoregister(WelcomeCoordinator.self, initializer: WelcomeCoordinator.init)
        autoregister(SignInCoordinator.self, initializer: SignInCoordinator.init)
        autoregister(LoginCoordinator.self, initializer: LoginCoordinator.init)
        autoregister(RegisterCoordinator.self, initializer: RegisterCoordinator.init)
        
        autoregister(MainTabCoordinator.self, initializer: MainTabCoordinator.init)
        autoregister(HomeCoordinator.self, initializer: HomeCoordinator.init)
        autoregister(CarDetailCoordinator.self, initializer: CarDetailCoordinator.init)
        
    }
}
