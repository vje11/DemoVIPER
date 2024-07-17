//
//  UniversityListingInteractor.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//  
//

import Foundation
import Networking
import Database

final class UniversityListingInteractor: UniversityListingInteractorInput {

    // MARK: - Properties

    weak var presenter: UniversityListingInteractorOutput?
    lazy var databaseService: UniversityRealmDatabaseServices? = UniversityRealmDatabaseServices()

    // MARK: - Initialization

    init() {

    }

    // MARK: - UniversityListingInteractorInput methods
    
    func getAllListOfUniversities(forCountry name: String) {
        presenter?.showLoader()
        var urlComponent = URLComponents(string: "http://universities.hipolabs.com/search")
        urlComponent?.queryItems = [
            URLQueryItem(name: "country", value: name)
        ]
        let url_ = urlComponent?.url
        let url = url_?.absoluteString ?? ""
        let resource = APIResource<Universities>(url: url, httpMethod: .get)
        
        NetworkManager.shared.executeApiRequest(resource: resource) { [weak self] data in
            self?.presenter?.hideLoader()
            switch data {
            case .success(let list, _): 
                self?.databaseService?.save(list ?? [])
                self?.presenter?.presentUniversityListDetails(universities: list ?? [])
                
            default:
                self?.databaseService?.fetch(completion: { result in
                    switch result {
                    case .success(let list):
                        self?.presenter?.presentUniversityListDetails(universities: list)
                    case .failure(_):
                        self?.presenter?.showError(type: .dataNotFound)
                    }
                })
            }
        }
    }
}
