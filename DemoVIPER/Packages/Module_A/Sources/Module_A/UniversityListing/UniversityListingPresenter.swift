//
//  UniversityListingPresenter.swift
//
//
//  Created by Vijay  on 17/07/2024.
//
//

import Foundation
import Database

final class UniversityListingPresenter: UniversityListingModuleInput {
    
    // MARK: - Properties
    
    weak var view: UniversityListingViewInput?
    var router: UniversityListingRouterInput!
    var interactor: UniversityListingInteractorInput!
    
    var universityList = Universities()
    var lastSearchedCountryName: String = "United Arab Emirates"
    
    lazy var refreshActionClosure: UniversityListingRefreshActionClosure = {
        self.refreshViewDetails()
    }
    
    // MARK: - Initialization
    
    init() {
        
    }
    
    // MARK: - UniversityListingModuleInput methods
}

// MARK: - UniversityListingViewOutput methods

extension UniversityListingPresenter: UniversityListingViewOutput {
    
    func viewLoaded() {
        
    }
    
    func viewWillAppear() {
        refreshViewDetails()
    }
    
    func refreshViewDetails() {
        guard !lastSearchedCountryName.isEmpty else { return }
        interactor.getAllListOfUniversities(forCountry: lastSearchedCountryName)
    }
    
    func userDidSelectedItem(atIndex idx: Int) {
        guard universityList.indices.contains(idx) else { return }
        let detail = universityList[idx]
        router.navigateToNextScreen(forSelectedUniversityDetail: detail)
    }
}

// MARK: - UniversityListingInteractorOutput methods

extension UniversityListingPresenter: UniversityListingInteractorOutput {
    func presentUniversityListDetails(universities: Universities) {
        self.universityList = universities
        var displayedList = [UniversityListTableViewListItem]()
        displayedList = universities.compactMap({
            return UniversityListTableViewListItem(title: $0.name ?? "",
                                                   subTitle: $0.stateProvince ?? "")
        })
        let details = UniversityListingViewDetails(displayedList: displayedList)
        view?.displayUniversitiesSearchList(viewDetails: details)
    }
    
    func showLoader() {
        view?.showLoader()
    }
    
    func hideLoader() {
        view?.hideLoader()
    }
    
    func showError(type: UniversityListingErrors) {
        
    }
}
