//
//  UniversityListingModuleBuilder.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//  
//

import UIKit

struct UniversityListingModuleBuilder {

    // MARK: - UniversityListingBuilder method

    static func buildModule(delegate: UniversityListingDelegate) -> UniversityListingViewController {
        let viewController = UniversityListingViewController()
        let router = UniversityListingRouter(viewController: viewController, delegate: delegate)
        let interactor = UniversityListingInteractor()
        let presenter = UniversityListingPresenter()

        viewController.presenter = presenter
        interactor.presenter = presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        return viewController
    }
}
