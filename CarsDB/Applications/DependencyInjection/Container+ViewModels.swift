//
//  Container+ViewModels.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/16/23.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    func registerViewModels() {
        autoregister(WelcomeViewModel.self, initializer: WelcomeViewModel.init)
        autoregister(SignInViewModel.self, initializer: SignInViewModel.init)
        autoregister(LoginViewModel.self, initializer: LoginViewModel.init)
        autoregister(RegisterViewModel.self, initializer: RegisterViewModel.init)
        
        autoregister(MainTabViewModel.self, initializer: MainTabViewModel.init)
        autoregister(HomeViewModel.self, initializer: HomeViewModel.init)
    }
}
