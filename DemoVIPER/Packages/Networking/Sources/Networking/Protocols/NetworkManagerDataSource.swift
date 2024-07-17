//
//  NetworkManagerDataSource.swift
//  
//
//  Created by Vijay  on 16/07/2024.
//

import Foundation

public protocol NetworkManagerDataSource {
    func getRequiredDefaultHeaders() -> HTTPHeaders
}

public extension NetworkManagerDataSource {
    func getRequiredDefaultHeaders() -> HTTPHeaders {
        return ["DeviceType": "ios"]
    }
}
