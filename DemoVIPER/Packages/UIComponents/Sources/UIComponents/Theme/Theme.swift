//
//  Theme.swift
//  
//
//  Created by vijay yadav on 09/11/22.
//

import Foundation
import UIKit

public enum ThemeType: String {
    case dark
    case light
}

open class ThemeManager: NSObject {
    var theme: Colors = LightColors()
    
    public static var shared = ThemeManager()
    
    // MARK: Setters Methods
    public func setTheme(type: ThemeType = ThemeManager.getSystemTheme()) {
        switch type {
        case .light:
            self.theme = LightColors()
        case .dark:
            self.theme = DarkColors()
        }
    }
}

extension ThemeManager {
    // MARK: Helper Functions
    
    /**
     * helper func helps to get system related theme
     */
    public static func getSystemTheme() -> ThemeType {
        switch UIScreen.main.traitCollection.userInterfaceStyle {
        case .light: return .light
        case .dark: return .dark
        case .unspecified: return .light
        @unknown default: return .light
        }
    }
    
    /**
     * Computed property to get the current selected theme
     */
    public var currentTheme: ThemeType {
        return theme is LightColors ? .light : .dark
    }
}

public extension Notification.Name {
    static let themeChange = Notification.Name("ThemeChange")
}
