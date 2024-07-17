//
//  UniversityListingRouter.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//  
//

import UIKit

final class UniversityListingRouter: UniversityListingRouterInput {

    // MARK: - Properties

    private weak var viewController: UniversityListingViewController?
    private weak var delegate: UniversityListingDelegate?

    // MARK: - Init

    init(viewController: UniversityListingViewController, delegate: UniversityListingDelegate) {
        self.viewController = viewController
        self.delegate = delegate
    }

    // MARK: - UniversityListingRouterInput methods
    
    func navigateToNextScreen(forSelectedUniversityDetail detail: University) {
        delegate?.didSelectUniversity(model: detail)
    }
}
