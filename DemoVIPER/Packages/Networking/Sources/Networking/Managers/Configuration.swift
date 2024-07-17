//
//  Configuration.swift
//
//
//  Created by Vijay  on 16/07/2024.
//

import UIKit

public struct NetworkManagerConfiguration {
    
    public var defaultHTTPHeaders: HTTPHeaders {
        guard let dataSource = NetworkManagerConfiguration.dataSource else {
            fatalError("####### `NetworkManagerConfiguration.dataSource` is not set #######")
        }
        return dataSource.getRequiredDefaultHeaders()
    }
    
    public var sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
    
    public static var dataSource: NetworkManagerDataSource?
}
