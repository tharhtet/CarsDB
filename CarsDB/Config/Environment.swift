//
//  Environment.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/19/23.
//

import Foundation

public enum Environment {
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let environment = "ENV"
            static let rootURL = "API_SERVER_URL"
            static let googleMapApiKey = "GOOGLE_MAP_API_KEY"
            static let googleGeocodingApiKey = "GOOGLE_GEOCODING_API_KEY"
            static let avatarS3URL = "AVATAR_S3_URL"
            static let baseS3URL = "BASE_S3_URL"
            static let applePayMerchantId = "APPLE_PAY_MERCHANT_ID"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    static let rootURL: String = {
        guard let rootURLstring = Environment.infoDictionary[Keys.Plist.rootURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        var prefix = "http://"
        if environment == "Production" {
            prefix = "https://"
        }
        return prefix + rootURLstring
    }()
    
    static let environment: String = {
        guard let environment = Environment.infoDictionary[Keys.Plist.environment] as? String else {
            fatalError("environment not set in plist for this environment")
        }
        return environment
    }()
    
    static let googleMapApiKey: String = {
        guard let googleMapApiKey = Environment.infoDictionary[Keys.Plist.googleMapApiKey] as? String else {
            fatalError("googleMapApiKey not set in plist for this environment")
        }
        return googleMapApiKey
    }()
    
    static let googleGeocodingApiKey: String = {
        guard let googleGeocodingApiKey = Environment.infoDictionary[Keys.Plist.googleGeocodingApiKey] as? String else {
            fatalError("googleGeocodingApiKey not set in plist for this environment")
        }
        return googleGeocodingApiKey
    }()
    
    static let avatarS3URL: String = {
        guard let avatarS3URL = Environment.infoDictionary[Keys.Plist.avatarS3URL] as? String else {
            fatalError("avatarS3URL not set in plist for this environment")
        }
        return "https://" + avatarS3URL
    }()
    
    static let baseS3URL: String = {
        guard let baseS3URL = Environment.infoDictionary[Keys.Plist.baseS3URL] as? String else {
            fatalError("baseS3URL not set in plist for this environment")
        }
        return "https://" + baseS3URL
    }()
    
    static let applePayMerchantId: String = {
        guard let applePayMerchantId = Environment.infoDictionary[Keys.Plist.applePayMerchantId] as? String else {
            fatalError("applePayMerchantId not set in plist for this environment")
        }
        return applePayMerchantId
    }()
}
