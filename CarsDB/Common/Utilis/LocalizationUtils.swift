//
//  LocalizationUtils.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/18/23.
//

import Foundation

enum LocalizationUtils {
    static var currentLocale: Locale {
        return Locale(identifier: "en_GB")
    }
    
    static func localize(key: String) -> String {
        return "en_GB"
    }
}
