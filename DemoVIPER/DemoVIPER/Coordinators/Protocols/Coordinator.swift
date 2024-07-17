//
//  Coordinator.swift
//  DemoVIPER
//
//  Created by Vijay  on 17/07/2024.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
