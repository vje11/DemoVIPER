//
//  ApiResults.swift
//  
//
//  Created by Vijay  on 16/07/2024.
//

import UIKit

public enum APIResults<DataModel> {
    case success(DataModel?, message: String?)
    case successWithoutData(message: String?)
    case failure(APIErrors)
}
