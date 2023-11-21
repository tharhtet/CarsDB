//
//  LocalStorage.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/19/23.
//

import Foundation

class LocalStorage {
    static let shared = LocalStorage()
    let defaults = UserDefaults.standard
    
    func setIsOnboarding(flag: Bool) {
        defaults.set(flag, forKey: AppConstants.StorageKeys.isOnboardingFinished)
    }
    
    func getIsOnboarding() -> Bool {
        return defaults.bool(forKey: AppConstants.StorageKeys.isOnboardingFinished)
    }
}
