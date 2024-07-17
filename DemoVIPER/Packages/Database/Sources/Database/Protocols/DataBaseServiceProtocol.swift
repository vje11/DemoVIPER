//
//  DataBaseServiceProtocol.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//

import RealmSwift

public protocol DataBaseServiceProtocol {
    associatedtype DataModel
    func save(_ dataModel: DataModel)
    func fetch(completion: @escaping (Result<DataModel, Error>) -> Void)
}
