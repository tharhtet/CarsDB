//
//  AppCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/16/23.
//

import UIKit
import FirebaseAuth

class AppCoordinator: BaseCoordinator {
    
    //private var window = UIWindow(frame: UIScreen.main.bounds)
    private var window: UIWindow?
    
    override func start(window: UIWindow?) {
        guard let window = window else { return }
        removeChildCoordinators()
        self.window = window
        
        let auth = Auth.auth()
        if auth.currentUser != nil {
            self.showHomeScreen()
        } else {
            if !LocalStorage.shared.getIsOnboarding() {
                self.showTutorial()
            } else {
                self.showSignInScreen()
            }
        }
    }
    
    private func showTutorial() {
        let coordinator = SceneDelegate.container.resolve(WelcomeCoordinator.self)!
        let navigation = BaseNavigationController()
        coordinator.navigationVC = navigation
        coordinator.window = window
        start(coordinator: coordinator)
    }
    
    private func showSignInScreen() {
        let coordinator = SceneDelegate.container.resolve(SignInCoordinator.self)!
        let navigation = BaseNavigationController()
        coordinator.navigationVC = navigation
        coordinator.window = window
        start(coordinator: coordinator)
    }
    
    private func showHomeScreen() {
        let coordinator = SceneDelegate.container.resolve(MainTabCoordinator.self)!
        let navigation = BaseNavigationController()
        coordinator.navigationVC = navigation
        coordinator.window = window
        start(coordinator: coordinator)
    }
}
