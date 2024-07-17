//
//  StatusCode.swift
//  
//
//  Created by Vijay  on 16/07/2024.
//

import Foundation

public enum StatusCode: Int {
    case success = 200
    case successWarning = 201
    case invalidRequest = 400
    case unauthorised = 401
    case notFound = 404
    case timeout = 408
    case conflict = 409
    case internalServerError = 500
    case serviceDown = 503
}

let STATUS_SUCCESS: [Int] = [StatusCode.success.rawValue, StatusCode.successWarning.rawValue]

