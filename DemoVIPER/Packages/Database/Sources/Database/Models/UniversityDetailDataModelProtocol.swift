//
//  UniversityDetailDataModelProtocol.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//

import Foundation
import RealmSwift

public protocol UniversityDetailProtocol {
    var country: String? { get set }
    var alphaTwoCode: String? { get set }
    var webPages: [String]? { get set }
    var name: String? { get set }
    var stateProvince: String? { get set }
}

public class University: Object, Codable, UniversityDetailProtocol {
    @objc dynamic public var country: String? = nil
    @objc dynamic public var alphaTwoCode: String? = nil
    @objc dynamic public var webPages: [String]? = nil
    @objc dynamic public var name: String? = ""
    @objc dynamic public var stateProvince: String? = nil
    
    public enum CodingKeys: String, CodingKey {
        case country
        case alphaTwoCode = "alpha_two_code"
        case webPages = "web_pages"
        case name
        case stateProvince = "state-province"
    }
    
    override public static func primaryKey() -> String? {
        return "name"
    }
    
    public override static func ignoredProperties() -> [String] {
        return ["webPages"]
    }
}

public typealias Universities = [University]
