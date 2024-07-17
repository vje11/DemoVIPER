// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

public struct Module_A {
    public static func getUniversityListingScene(delegate: UniversityListingDelegate) -> UIViewController {
        let viewController = UniversityListingModuleBuilder.buildModule(delegate: delegate)
        return viewController
    }
}
