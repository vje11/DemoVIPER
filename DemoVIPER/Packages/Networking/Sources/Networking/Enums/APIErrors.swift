//
//  ResponseErrors.swift
//  
//
//  Created by Vijay  on 16/07/2024.
//

import UIKit

public enum APIErrors: Error {
    case backend
    case noInternet
    case decodingFailed
    case dataUnavailable
    case unauthorised
    case resourceObjectNotFormedProperly
    case custom(message: String)
    case withObject(error: CustomErrorProtocol)
}
