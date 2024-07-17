//
//  ViewController.swift
//  DemoVIPER
//
//  Created by Vijay  on 16/07/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnStart: UIButton!
    
    var universityModeulFlowCoordinator: UniversityModuleFlow?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButtonPressed() {
        universityModeulFlowCoordinator = UniversityModuleFlow(navigationController: self.navigationController)
        universityModeulFlowCoordinator?.start()
    }

}

