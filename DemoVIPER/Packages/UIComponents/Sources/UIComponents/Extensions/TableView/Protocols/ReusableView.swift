//
//  ReusableView.swift
//  
//
//  Created by Vijay Bahadur Yadav on 18/07/21.
//

public protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

