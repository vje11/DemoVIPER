//
//  UIColor+Extension.swift
//  
//
//  Created by vijay yadav on 07/10/22.
//

import UIKit

public extension UIColor {
    /**
        Creates an UIColor from HEX String in `#363636` format `#RRGGBBAA` OR `#RRGGBB`
        - parameter hexString: HEX String in `#363636` format
        - returns: UIColor from HexString
     */
    
    convenience init(hexString: String) {
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner  = Scanner(string: hexString as String)
        
        if !hexString.hasPrefix("#") {
            debugPrint("Bad input: init(hexString: String) function")
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
        } else {
            
            scanner.scanLocation = 1
            var color: UInt64 = 0
            scanner.scanHexInt64(&color)
            
            let mask = 0x000000FF
            let hasAlphaChar = hexString.count == 9
            
            let r = (hasAlphaChar ? Int(color >> 24) : Int(color >> 16)) & mask
            let g = (hasAlphaChar ? Int(color >> 16) : Int(color >> 8)) & mask
            let b = (hasAlphaChar ? Int(color >> 8) : Int(color)) & mask
            let a = hasAlphaChar ? Int(color) & mask : 255
            
            let red   = CGFloat(r) / 255.0
            let green = CGFloat(g) / 255.0
            let blue  = CGFloat(b) / 255.0
            let alpha = CGFloat(a) / 255.0
            
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
    }
}

/// Hex Transparency values
/*
 100% — FF
 95% — F2
 90% — E6
 85% — D9
 80% — CC
 75% — BF
 70% — B3
 65% — A6
 60% — 99
 55% — 8C
 50% — 80
 45% — 73
 40% — 66
 35% — 59
 30% — 4D
 25% — 40
 20% — 33
 15% — 26
 10% — 1A
 5% — 0D
 0% — 00
 */

public extension UIColor {
    
    var hex: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        self.getRed(&r, green: &g, blue: &b, alpha: &a)

        let rInt = Int(r * 255) << 24
        let gInt = Int(g * 255) << 16
        let bInt = Int(b * 255) << 8
        let aInt = Int(a * 255)

        let rgba = rInt | gInt | bInt | aInt

        return String(format:"#%08x", rgba)
    }

    var shortHex: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        self.getRed(&r, green: &g, blue: &b, alpha: &a)

        return String(
            format: "#%02x%02x%02x",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }

}
