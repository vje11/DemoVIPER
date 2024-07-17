//
//  CustomErrorProtocol.swift
//  
//
//  Created by Vijay  on 16/07/2024.
//

import Foundation

public protocol CustomErrorProtocol {
    var msg: String? { get set }
    var name: String? { get set }
    var errorCode: Int { get set }
}
