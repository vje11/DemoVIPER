//
//  DLCTimeLineColors.swift
//  
//
//  Created by Jeet Kapadia on 06/03/23.
//

import Foundation
import UIKit

public protocol DLCTimeLineColorProtocol {
    var bottomBarBackgroundColor: UIColor { get }
}

extension Color {
    public enum DLCTimeLineColors {
        public static var bottomBarBackgroundColor: UIColor {
            return ThemeManager.shared.theme.bottomBarBackgroundColor
        }
    }
}
