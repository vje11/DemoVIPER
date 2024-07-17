//
//  NetworkManager.swift
//  
//
//  Created by Vijay  on 16/07/2024.
//

import UIKit

public final class NetworkManager {
    /**
     * `config` network related configuratiosn are stored here
     */
    private var defaultNetworkConfig = NetworkManagerConfiguration()
    
    /**
     * `init()` private accessible initaliser as it's a plain class file
     */
    private init() { }
    
    /// `shared` - singleton object to acces the newtwok manager
    public static let shared = NetworkManager()
}

// MARK: Network Call
extension NetworkManager {
    public func executeApiRequest<T: Decodable>(resource: APIResource<T>,
                                                config: NetworkManagerConfiguration = NetworkManager.shared.defaultConfig,
                                                completion: @escaping NetworkResponseHandler<T>) {
        
        // If no internet is available, return the control directly without executing it
        /**
        guard self.isOnline else {
            DispatchQueue.main.async {
                completion(.failure(Errors.noInternet))
            }
            return
        }
         */

        // Create URLRequest object from resource data
        guard let request = resource.getURLRequest() else {
            DispatchQueue.main.async {
                completion(.failure(APIErrors.resourceObjectNotFormedProperly))
            }
            return
        }

        // Create URLSession from sessionConfig
        let session = URLSession(configuration: config.sessionConfig)

        let task = session.dataTask(with: request) { data, response, error in
            
            // Since API request executed on background thread, need to transfer it on main thread
            DispatchQueue.main.async {
                if error != nil {
                    // Handle HTTP request error
                    completion(.failure(APIErrors.dataUnavailable))
                } else if let data = data {
                    // Handle HTTP request response
                    do {
                        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedResponse, message: ""))
                    } catch {
                        completion(.failure(APIErrors.decodingFailed))
                    }
                } else {
                    completion(.failure(APIErrors.dataUnavailable))
                }
            }
        }
        task.resume()
    }

}

// MARK: Setters
extension NetworkManager {
    
    public func setConfig(_ config: NetworkManagerConfiguration) {
        self.defaultNetworkConfig = config
    }
}

// MARK: Getters
extension NetworkManager {

    public var defaultConfig: NetworkManagerConfiguration {
        return self.defaultNetworkConfig
    }
}
