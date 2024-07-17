//
//  UniversityDetailsProtocols.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//  
//

import UIKit
import Networking

public protocol UniversityDetailsDelegate: AnyObject {
    func refreshButtonPressed()
}

// MARK: - View

protocol UniversityDetailsViewInput: AnyObject {
    func displayUniversityDetails(viewModel: UniversityDetailViewModel)
}

// MARK: - Presenter (ViewController to Presenter communication)

protocol UniversityDetailsViewOutput: AnyObject {
    func viewLoaded()
}

// MARK: - Presenter

protocol UniversityDetailsModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: UniversityDetailsViewInput? { get set }
    var interactor: UniversityDetailsInteractorInput! { get set }
    var router: UniversityDetailsRouterInput! { get set }
}

// MARK: - Presenter (Interactor to Presenter communication)

protocol UniversityDetailsInteractorOutput: AnyObject {
}

// MARK: - Interactor

protocol UniversityDetailsInteractorInput: AnyObject {
}

// MARK: - Router

protocol UniversityDetailsRouterInput: AnyObject {
}

// MARK: Models
public typealias UniversityDetailProtocolReference = UniversityDetailProtocol
struct UniversityDetailViewModel: UniversityDetailProtocolReference {
    var country: String?
    var alphaTwoCode: String?
    var webPages: [String]?
    var name: String?
    var stateProvince: String?
    var attributedStringWebPage: NSAttributedString?
    
    init(universityDetail: UniversityDetailProtocolReference) {
        self.country = universityDetail.country
        self.alphaTwoCode = universityDetail.alphaTwoCode
        self.webPages = universityDetail.webPages
        self.name = universityDetail.name
        self.stateProvince = universityDetail.stateProvince
        var webPagesString = ""
        for url in webPages ?? [] {
            webPagesString = webPagesString + url + "\n"
        }
        self.attributedStringWebPage = webPagesString.generateAttributedStringWithLink(linkText: universityDetail.webPages ?? [], linkURL: universityDetail.webPages ?? [])
    }
}
