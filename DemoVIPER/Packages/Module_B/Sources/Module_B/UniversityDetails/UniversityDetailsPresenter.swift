//
//  UniversityDetailsPresenter.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//  
//

import Foundation

final class UniversityDetailsPresenter: UniversityDetailsModuleInput {

    // MARK: - Properties

    weak var view: UniversityDetailsViewInput?
    var router: UniversityDetailsRouterInput!
    var interactor: UniversityDetailsInteractorInput!
    var universityDetail: UniversityDetailProtocolReference

    // MARK: - Initialization

    init(universityDetail: UniversityDetailProtocolReference) {
        self.universityDetail = universityDetail
    }

    // MARK: - UniversityDetailsModuleInput methods
}

// MARK: - UniversityDetailsViewOutput methods

extension UniversityDetailsPresenter: UniversityDetailsViewOutput {

    func viewLoaded() {
        view?.displayUniversityDetails(viewModel: UniversityDetailViewModel(universityDetail: self.universityDetail))
    }
}

// MARK: - UniversityDetailsInteractorOutput methods

extension UniversityDetailsPresenter: UniversityDetailsInteractorOutput {

}
