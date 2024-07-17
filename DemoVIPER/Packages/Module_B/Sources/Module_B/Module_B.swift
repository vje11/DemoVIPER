// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

public struct Module_B {
    public static func getUniversityDetailScene(universityDetail: UniversityDetailProtocolReference,
                                         delegate: UniversityDetailsDelegate) -> UIViewController {
        let viewController = UniversityDetailsModuleBuilder.buildModule(universityDetail: universityDetail,
                                                                        delegate: delegate)
        return viewController
    }
}
