//
//  UITableViewExtensions.swift
//  
//
//  Created by Vijay Bahadur Yadav on 24/08/21.
//

import UIKit

extension UITableView {
    /// Registers the given cell
    public func registerClass(cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    /// Register Table View Cell Nib
    public func registerCell(with identifier: UITableViewCell.Type) {
        self.register(UINib(nibName: "\(identifier.self)", bundle: nil),
                      forCellReuseIdentifier: "\(identifier.self)")
    }
    
    /// Dequeue Table View Cell
    public func dequeueCell <T: UITableViewCell> (with indexPath: IndexPath? = nil) -> T {
        if let index = indexPath {
            return self.dequeueReusableCell(withIdentifier: "\(T.reuseIdentifier)", for: index) as! T
        } else {
            return self.dequeueReusableCell(withIdentifier: "\(T.reuseIdentifier)") as! T
        }
    }
    
    public func showActivityForPagination(isHidden: Bool) {
        var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        spinner.color = .darkGray
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.bounds.width, height: CGFloat(50))
        self.tableFooterView = spinner
        self.tableFooterView?.isHidden = isHidden
    }
}

extension UITableView {
    /// HeadertFooter view
    
    /// Registers the given header/footer cell
    public func registerHeaderFooterClass(cellType: UITableViewHeaderFooterView.Type) {
        register(cellType, forHeaderFooterViewReuseIdentifier: cellType.reuseIdentifier)
    }
    
    /// Register Table View header Nib
    public func registerHeaderFooterCell(with identifier: UITableViewHeaderFooterView.Type) {
        self.register(UINib(nibName: "\(identifier.self)", bundle: nil),
                      forHeaderFooterViewReuseIdentifier: "\(identifier.self)")
    }
    
    /// Dequeue Reusable Header Footer View
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView> () -> T {
        return self.dequeueReusableHeaderFooterView(withIdentifier: "\(T.reuseIdentifier)") as! T
    }
}
