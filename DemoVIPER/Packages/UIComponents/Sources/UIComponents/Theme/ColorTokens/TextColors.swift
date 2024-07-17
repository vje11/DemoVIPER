//
//  File.swift
//  
//
//  Created by vijay yadav on 10/11/22.
//

import UIKit

extension Color {
    public enum Text {
        public static var heading: UIColor {
            return ThemeManager.shared.theme.heading
        }
        
        public static var paragraph: UIColor {
            return ThemeManager.shared.theme.paragraph
        }
        
        public static var subtext: UIColor {
            return ThemeManager.shared.theme.subtext
        }
        
        public static var disabled: UIColor {
            return ThemeManager.shared.theme.disabled
        }
        
        public static var infomative: UIColor {
            return ThemeManager.shared.theme.informative
        }
        
        public static var success: UIColor {
            return ThemeManager.shared.theme.success
        }
        
        public static var critical: UIColor {
            return ThemeManager.shared.theme.critical
        }
        
        public static var black: UIColor {
            return .black
        }
        
        public static var white: UIColor {
            return .white
        }
        
        public static var solidParagraph: UIColor {
            return ThemeManager.shared.theme.solidParagraph
        }
    }
    
}
