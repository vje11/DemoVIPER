//
//  File.swift
//  
//
//  Created by vijay yadav on 09/11/22.
//

import UIKit

/**
 * Brand specific tokens
 */
public protocol BrandColor {
    var primary: UIColor { get }
    var secondary: UIColor { get }
    var tertiary: UIColor { get }
}

/**
 * Base tokens
 */
public protocol DefaultColor {
    var white: UIColor { get }
    var black: UIColor { get }
    var divider: UIColor { get }
    var border: UIColor { get }
    /// `Selection (surface BG)`:  This surface indicates the slected elements in the UI like slected option, slected tabs
    var selection: UIColor { get }
    /// `Primary (surface)`:  This surface rest on the top of the BG
    var primarySurf: UIColor { get }
    /// `Secondary (surface varient)`:  This surface rest on the top of the primary or BG
    var secondarySurf: UIColor { get }
    /// `background`: It is the surface on which the UI is resting on, BG can be different & changed according to the context
    var background: UIColor { get }
    var dropShadow: UIColor { get }
    var solidWhite: UIColor { get }
    var solidBlack: UIColor { get }
    var solidSearchBackground: UIColor { get }
    var solidPrimarySurf: UIColor { get }
}

/**
 * Overall color tokens
 */
public protocol Colors: BrandColor, DefaultColor, RedColorProtocol, BlueColorProtocol, GreyColorProtocol, GreenColorProtocol, OrangeColorProtocol, VioletColorProtocol, YellowColorProtocol, NavigationColorProtocol, DLCTimeLineColorProtocol, PinkColorProtocol, PollColor, PassProColorProtocol {
    var heading: UIColor { get }
    var paragraph: UIColor { get }
    var subtext: UIColor { get }
    var disabled: UIColor { get }
    var critical: UIColor { get }
    var success: UIColor { get }
    var background: UIColor { get }
    var informative: UIColor { get }
    var black: UIColor { get }
    var white: UIColor { get }
    var solidParagraph: UIColor { get }
    /**
     * Optional method to update the default colors in particular theme
     */
    mutating func setColors(color: Colors)
}

/**
 * Optional methods are added here to provide default implementation
 */
extension Colors {
    mutating func setColors(color: Colors) { }
}

public protocol PollColor {
    var pollbackground: UIColor { get }
    var pollPlaceholderText: UIColor { get }
    var pollTextColor: UIColor { get }
}
