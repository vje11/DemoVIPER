//
//  ApiResource.swift
//  
//
//  Created by Vijay  on 16/07/2024.
//

import UIKit

public struct APIResource<T: Decodable> {
    public let url: String
    public var body: Any?
    public var httpMethod = HTTPMethod.get
    public var httpHeaders = NetworkManager.shared.defaultConfig.defaultHTTPHeaders
    
    public init(url: String,
                body: Parameters? = nil,
                httpMethod: HTTPMethod = HTTPMethod.get,
                httpHeaders: HTTPHeaders = NetworkManager.shared.defaultConfig.defaultHTTPHeaders) {
        self.url = url
        self.body = body
        self.httpMethod = httpMethod
        self.httpHeaders = httpHeaders
    }
}

extension APIResource {
    /**
     * `getURLRequest()` will create the HTTP  URLRequest if the all resources are formed currectly
     */
    func getURLRequest() -> URLRequest? {
        if let url = URL(string: self.url) {
            var request = URLRequest(url: url)
            request.httpMethod = self.httpMethod.rawValue
            // pass all header fileds in URLRequest object
            for (key, values) in self.httpHeaders {
                request.setValue(values, forHTTPHeaderField: key)
            }
            
            // pass request body in URLRequest object
            if let body = self.body {
                    let bodyData = try? JSONSerialization.data(
                        withJSONObject: body,
                        options: []
                    )
                    request.httpBody = bodyData
                    request.setValue("\(bodyData?.count ?? 0)", forHTTPHeaderField: "Content-Length")
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            
            return request
        }
        return nil
    }
}
