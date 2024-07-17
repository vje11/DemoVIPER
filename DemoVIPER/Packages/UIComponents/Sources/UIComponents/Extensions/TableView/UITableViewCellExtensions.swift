//
//  UITableViewCellExtensions.swift
//  
//
//  Created by Vijay Bahadur Yadav on 24/08/21.
//

import UIKit

extension UITableViewCell: ReusableView {
    public static var nibName: String {
        return String(describing: self)
    }

    public static var xib: UINib {
        let nibName = String(describing: self)
        return UINib(nibName: nibName, bundle: Bundle(for: Self.self))
    }
}
