//
//  ColorToken.swift
//  
//
//  Created by vijay yadav on 09/11/22.
//

import UIKit

public enum Color {
    public static var white: UIColor {
        return ThemeManager.shared.theme.white
    }
    
    public static var black: UIColor {
        return ThemeManager.shared.theme.black
    }
    
    public static var selection: UIColor {
        return ThemeManager.shared.theme.selection
    }
    
    public static var divider: UIColor {
        return ThemeManager.shared.theme.divider
    }
    
    public static var dropShadow: UIColor {
        return ThemeManager.shared.theme.dropShadow
    }
    
    public static var border: UIColor {
        return ThemeManager.shared.theme.border
    }
    
    public static var solidWhite: UIColor {
        return ThemeManager.shared.theme.solidWhite
    }
    
    public static var solidBlack: UIColor {
        return ThemeManager.shared.theme.solidBlack
    }
    
    public static var pollBackGround: UIColor {
        return ThemeManager.shared.theme.pollbackground
    }
    
    public static var pollPlaceholder: UIColor {
        return ThemeManager.shared.theme.pollPlaceholderText
    }
    
    public static var pollTextColor: UIColor {
        return ThemeManager.shared.theme.pollTextColor
    }
    
    public static var solidSearchBackground: UIColor {
        return ThemeManager.shared.theme.solidSearchBackground
    }
}
