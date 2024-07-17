//
//  RealmDatabaseServices.swift
//
//
//  Created by Vijay  on 17/07/2024.
//

import RealmSwift

final public class UniversityRealmDatabaseServices: DataBaseServiceProtocol {
    private let realm = try! Realm()
    public typealias DataModel = [University]
    
    public init() {
        
    }
    
    public func save(_ dataModel: [University]) {
        try! realm.write {
            realm.add(dataModel, update: .all)
        }
    }
    
    public func fetch(completion: @escaping (Result<[University], any Error>) -> Void) {
        let universities = realm.objects(University.self)
        completion(.success(Array(universities)))
    }
}
