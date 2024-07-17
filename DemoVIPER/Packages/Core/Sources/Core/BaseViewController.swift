//
//  BaseViewController.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//

import UIKit
import UIComponents

open class BaseViewController: UIViewController {
    
    /// loader
    
    public var appWindow: UIWindow? {
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })
    }
    
    public var isParentExist: Bool {
        self.parent != nil && !(self.parent is UINavigationController)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        styleProgressHUD()
        // Do any additional setup after loading the view.
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
     
    private func styleProgressHUD() {
        ProgressHUD.animationType = .circleRotateChase
        ProgressHUD.colorHUD = Color.Background.primary
        ProgressHUD.colorBackground = Color.Background.primary
        ProgressHUD.colorAnimation = Color.Text.heading
        ProgressHUD.colorProgress = Color.Blue.blue60
        ProgressHUD.colorStatus = Color.Text.paragraph
        ProgressHUD.fontStatus = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    // MARK: Indicators
    public func showIndicator(_ message: String = "Please wait...") {
        if isParentExist {
            ProgressHUD.show(message)
        } else {
            ProgressHUD.show(message, inParentView: self.view)
        }
    }
    
    public func hideIndicator() {
        ProgressHUD.dismiss()
    }

}
