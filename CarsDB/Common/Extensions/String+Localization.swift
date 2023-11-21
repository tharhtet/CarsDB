//
//  String+Localization.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/18/23.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        return LocalizationUtils.localize(key: self)
    }
    
    var localizedUpper: String {
        return LocalizationUtils.localize(key: self).uppercased()
    }
}
