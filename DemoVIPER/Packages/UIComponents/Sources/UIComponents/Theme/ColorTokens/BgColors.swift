//
//  File.swift
//  
//
//  Created by vijay yadav on 09/11/22.
//

import UIKit

extension Color {
    public enum Background {
        public static var primary: UIColor {
            return ThemeManager.shared.theme.primarySurf
        }
        
        public static var secondary: UIColor {
            return ThemeManager.shared.theme.secondarySurf
        }
        
        public static var background: UIColor {
            return ThemeManager.shared.theme.background
        }
        
        public static var solid_primary: UIColor {
            return ThemeManager.shared.theme.solidPrimarySurf
        }
    }
}
