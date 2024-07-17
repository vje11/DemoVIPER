//
//  UniversityDetailsModuleBuilder.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//  
//

import UIKit

struct UniversityDetailsModuleBuilder {

    // MARK: - UniversityDetailsBuilder method

    static func buildModule(universityDetail: UniversityDetailProtocolReference,
                            delegate: UniversityDetailsDelegate) -> UniversityDetailsViewController {
        let viewController = UniversityDetailsViewController()
        let router = UniversityDetailsRouter(viewController: viewController,
                                             delegate: delegate)
        let interactor = UniversityDetailsInteractor()
        let presenter = UniversityDetailsPresenter(universityDetail: universityDetail)

        viewController.presenter = presenter
        interactor.presenter = presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        return viewController
    }
}
