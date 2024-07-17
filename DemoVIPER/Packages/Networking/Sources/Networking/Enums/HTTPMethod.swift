//
//  HTTPMethod.swift
//  
//
//  Created by Vijay  on 16/07/2024.
//

import UIKit

public struct HTTPMethod: RawRepresentable {
    /// `GET` method.
    public static let get = HTTPMethod(rawValue: "GET")
    /// `POST` method.
    public static let post = HTTPMethod(rawValue: "POST")
    
    /// `PUT` method.
    public static let put = HTTPMethod(rawValue: "PUT")
    
    /// `DELETE` method
    public static let delete = HTTPMethod(rawValue: "DELETE")

    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
