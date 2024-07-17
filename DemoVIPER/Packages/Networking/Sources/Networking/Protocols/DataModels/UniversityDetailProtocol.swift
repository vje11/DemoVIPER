//
//  UniversityDetailProtocol.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//

import UIKit

public protocol UniversityDetailProtocol {
    var country: String? { get set }
    var alphaTwoCode: String? { get set }
    var webPages: [String]? { get set }
    var name: String? { get set }
    var stateProvince: String? { get set }
}
