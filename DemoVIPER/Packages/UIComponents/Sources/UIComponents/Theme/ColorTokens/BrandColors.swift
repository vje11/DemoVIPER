//
//  BrandColors.swift
//  
//
//  Created by vijay yadav on 09/11/22.
//

import UIKit

extension Color {
    public enum Brand {
        public static var background: UIColor {
            return ThemeManager.shared.theme.background
        }
        
        public static var primary: UIColor {
            return ThemeManager.shared.theme.primary
        }
        
        public static var secondary: UIColor {
            return ThemeManager.shared.theme.secondary
        }
        
        public static var tertiary: UIColor {
            return ThemeManager.shared.theme.tertiary
        }
    }
}
