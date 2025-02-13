//
//  UniversityModuleFlow.swift
//  DemoVIPER
//
//  Created by Vijay  on 17/07/2024.
//

import UIKit
import Module_A
import Module_B

final class UniversityModuleFlow: Coordinator {
    var navigationController: UINavigationController?
    var refreshActionClosure: UniversityListingRefreshActionClosure?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let listing = Module_A.getUniversityListingScene(delegate: self)
        refreshActionClosure = listing.refreshActionClosure
        self.navigationController?.pushViewController(listing.viewComtroller, animated: true)
    }
    
    private func showUniversityDetailsScene(model: UniversityDetailProtocolReference) {
        let detail = Module_B.getUniversityDetailScene(universityDetail: model, delegate: self)
        self.navigationController?.present(detail, animated: true)
    }
}

extension UniversityModuleFlow: UniversityListingDelegate {
    func didSelectUniversity(model: UniversityDetailProtocolReference) {
        showUniversityDetailsScene(model: model)
    }
}

extension UniversityModuleFlow: UniversityDetailsDelegate {
    func refreshButtonPressed() {
        refreshActionClosure?()
    }
}
