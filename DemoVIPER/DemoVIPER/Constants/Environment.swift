//
//  Environment.swift
//  DemoVIPER
//
//  Created by Vijay  on 17/07/2024.
//

import Foundation
import Networking
/// Defines set of Environment variables that will be used across the app for different Environments. Mainly corresponds to Local Staging/UAT, Production Debug and Production Release.
enum Environment {
    
    /// List of Keys set in the Information Dictionary.
    enum Keys {
        
        enum API: String {
            case baseURL = "AppBaseURL"
            case isDebugMode = "IsDebugMode"
        }
        
        enum AppDetails: String {
            case appName = "AppName"
            case displayName = "Display"
        }
        
    }
    
    /// Method to fetch Info Dictionary for the specific Environment
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    /// Returns BASE URL String set in the configuration.
    static let baseURL: String = {
        guard let baseURL = Environment.infoDictionary[Keys.API.baseURL.rawValue] as? String else {
            fatalError("Base URL is not set in the plist for the current environment.")
        }
        return baseURL
    }()
    
    /// Returns areDebugMode value set in the configuration.
    static let isDebugMode: Bool  = {
        guard let localizedIsDebugMode = Environment.infoDictionary[Keys.API.isDebugMode.rawValue] as? String else {
            fatalError("IsAppStoreBuild value is not set in the plist for the current environment.")
        }
        
        guard let value = Bool(localizedIsDebugMode) else {
            fatalError("Could not create Bool type with the given isAppStoreBuild value")
        }
        
        return value
    }()
    
    
    // MARK: - API
    private static let appDetails: [String: String] = {
        guard let appdetails = Environment.infoDictionary["AppDetails"] as? [String: String] else {
            fatalError("App Details are not set in the plist for the current environment.")
        }
        return appdetails
    }()
    
    static let appName: String = {
        guard let sourceApp = Environment.appDetails[Keys.AppDetails.appName.rawValue] else {
            fatalError("App name is not set in the plist for the current environment.")
        }
        
        return sourceApp
    }()
    
    static let displayName: String = {
        guard let displayName = Environment.appDetails[Keys.AppDetails.displayName.rawValue] else {
            fatalError("Display name is not set in the plist for the current environment.")
        }
        
        return displayName
    }()
}

// To provide the access of font and other resources to the packages
struct AppConfiguration {
    public static var shared = AppConfiguration()
}

// MARK: Create default http headers
extension AppConfiguration: NetworkManagerDataSource {
    func enableLogging() -> Bool {
        return Environment.isDebugMode
    }
    
    func getRequiredDefaultHeaders() -> HTTPHeaders {
        var headers: HTTPHeaders = [:]
        return headers
    }
}
