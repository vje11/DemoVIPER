//
//  UniversityListingProtocols.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//  
//

import UIKit
import Networking

// MARK: Delegate
public protocol UniversityListingDelegate: AnyObject {
    func didSelectUniversity(model: UniversityDetailProtocol)
}

// MARK: - View

protocol UniversityListingViewInput: AnyObject {
    func displayUniversitiesSearchList(viewDetails: UniversityListingViewDetails)
    func showLoader()
    func hideLoader()
    func showError(type: UniversityListingErrors)
}

// MARK: - Presenter (ViewController to Presenter communication)

protocol UniversityListingViewOutput: AnyObject {
    func viewLoaded()
    func viewWillAppear()
    func userDidSelectedItem(atIndex idx: Int)
}

// MARK: - Presenter

protocol UniversityListingModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: UniversityListingViewInput? { get set }
    var interactor: UniversityListingInteractorInput! { get set }
    var router: UniversityListingRouterInput! { get set }
}

// MARK: - Presenter (Interactor to Presenter communication)

protocol UniversityListingInteractorOutput: AnyObject {
    func presentUniversityListDetails(universities: Universities)
    func showLoader()
    func hideLoader()
    func showError(type: UniversityListingErrors)
}

// MARK: - Interactor

protocol UniversityListingInteractorInput: AnyObject {
    func getAllListOfUniversities(forCountry name: String)
}

// MARK: - Router

protocol UniversityListingRouterInput: AnyObject {
    func navigateToNextScreen(forSelectedUniversityDetail detail: University)
}

// Entity

enum UniversityListingErrors {
    case dataNotFound
    case custom(message: String)
    
    var message: String {
        switch self {
        case .dataNotFound:
            return "Data not found"
        case .custom(let message):
            return message
        }
    }
}

// MARK: ViewModels

typealias UniversityListTableViewListItem = UniversityListTableViewCellViewModel

struct UniversityListingViewDetails {
    var displayedList: [UniversityListTableViewListItem] = []
}
