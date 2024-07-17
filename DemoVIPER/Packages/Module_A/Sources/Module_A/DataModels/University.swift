// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let university = try? newJSONDecoder().decode(University.self, from: jsonData)

import Foundation
import Networking

// MARK: - University
public struct University: Codable, UniversityDetailProtocol {
    public var domains: [String]?
    public var country: String?
    public var alphaTwoCode: String?
    public var webPages: [String]?
    public var name: String?
    public var stateProvince: String?
    
    enum CodingKeys: String, CodingKey {
        case domains, country
        case alphaTwoCode = "alpha_two_code"
        case webPages = "web_pages"
        case name
        case stateProvince = "state-province"
    }
}

typealias Universities = [University]
