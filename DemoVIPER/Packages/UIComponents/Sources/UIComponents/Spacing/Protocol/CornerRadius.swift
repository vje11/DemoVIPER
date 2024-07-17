//
//  CornerRadius.swift
//  
//
//  Created by vijay yadav on 17/10/23.
//

import UIKit

/**
 * `CornerRadiusProtocol` is to provide the token for view corner radius
 */
public protocol CornerRadiusProtocol {
    static var radius_xs: CGFloat { get }
    static var radius_s: CGFloat { get }
    static var radius_m: CGFloat { get }
    static var radius_l: CGFloat { get }
    static var radius_xl: CGFloat { get }
    static var radius_xxl: CGFloat { get }
}

