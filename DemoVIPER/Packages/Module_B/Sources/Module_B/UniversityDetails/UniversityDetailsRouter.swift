//
//  UniversityDetailsRouter.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//  
//

import UIKit

final class UniversityDetailsRouter: UniversityDetailsRouterInput {

    // MARK: - Properties

    private weak var viewController: UniversityDetailsViewController?
    private weak var delegate: UniversityDetailsDelegate?

    // MARK: - Init

    init(viewController: UniversityDetailsViewController, delegate: UniversityDetailsDelegate) {
        self.viewController = viewController
        self.delegate = delegate
    }

    // MARK: - UniversityDetailsRouterInput methods
}
