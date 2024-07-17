//
//  NavigationColorProtocol.swift
//  
//
//  Created by Jeet Kapadia on 06/03/23.
//

import Foundation
import UIKit

/**
 * Navigation color tokens
 */
public protocol NavigationColorProtocol {
    var titleTextColor: UIColor { get }
    var backgroundColor: UIColor { get }
}

extension Color {
    public enum Navigation {
        public static var titleTextColor: UIColor {
            return ThemeManager.shared.theme.titleTextColor
        }

        public static var backgroundColor: UIColor {
            return ThemeManager.shared.theme.backgroundColor
        }
    }
}
