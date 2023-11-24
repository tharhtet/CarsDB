//
//  AppConstants.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/19/23.
//

import Foundation

struct AppConstants {
    
    struct API {
        enum APIVersion: String {
            case v1 = "v1"
            case v2 = "v2"
        }
        
        static let baseURL =  Environment.rootURL
        static let avatarBaseUrl = Environment.avatarS3URL
        static let s3BaseUrl = Environment.baseS3URL
        static let currentVersion = APIVersion.v2.rawValue
    }
    
    struct Credential {
        static let googleMapAPIKey = Environment.googleMapApiKey
        static let googleGeocodingAPIKey = Environment.googleGeocodingApiKey
        static let applePayMerchantId = Environment.applePayMerchantId
    }
    
    struct CustomURL {
        static let brainTree = "\(Bundle.main.bundleIdentifier!).payments"
        static let stripeGrabPay = "\(Bundle.main.bundleIdentifier!)"
    }
    
    struct Notification {
        //static let InvalidToken = Foundation.Notification.Name("InvalidToken")
        //static let InvalidTokenNoActiveSession = Foundation.Notification.Name("InvalidTokenNoActiveSession")
    }
    
    struct StorageKeys {
        static let isOnboardingFinished = "isOnboardingFinished"
    }
}
