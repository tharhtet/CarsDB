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
            case v3 = "v3"
        }
        
        static let baseURL =  Environment.rootURL//currentEnvironment.baseURL
        static let avatarBaseUrl = Environment.avatarS3URL //"https://dindinn-staging.s3.ap-southeast-1.amazonaws.com/public/images/avatars/"
        static let s3BaseUrl = Environment.baseS3URL //"https://dindinn-staging.s3.ap-southeast-1.amazonaws.com/"
        static let currentVersion = APIVersion.v2.rawValue
    }
    
    struct Credential {
        static let googleMapAPIKey = Environment.googleMapApiKey //"AIzaSyAH7QEyzpy7qKTiZlpu-6wJprAmp57yKGM"
        static let googleGeocodingAPIKey = Environment.googleGeocodingApiKey //"AIzaSyBdHugsOCe6GLZk3RXSqeWWPdoKF4Gq3M4"
        static let applePayMerchantId = Environment.applePayMerchantId
    }
    
    struct CustomURL {
        static let brainTree = "\(Bundle.main.bundleIdentifier!).payments"
        static let stripeGrabPay = "\(Bundle.main.bundleIdentifier!)"
        static let stripePayment = "https://dindinn.com/checkout-success"
    }
    
    struct Misc {
        
    }
    
    struct Notification {
        //static let InvalidToken = Foundation.Notification.Name("InvalidToken")
        //static let InvalidTokenNoActiveSession = Foundation.Notification.Name("InvalidTokenNoActiveSession")
    }
    
    struct StorageKeys {
        static let isOnboardingFinished = "isOnboardingFinished"
    }
}
