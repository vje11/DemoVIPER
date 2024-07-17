//
//  Apply.swift
//
//
//  Created by vijay yadav on 07/10/22.
//

import UIKit

public protocol Apply { }

/// clean way to provide closure to set the properties of the object.
extension Apply where Self: NSObject {
    
    @discardableResult
    public func apply(_ closure: (Self) throws -> Void) rethrows -> Self {
        try closure(self)
        return self
    }
    
    public func `do`(_ closure: (Self) throws -> Void) rethrows {
        try closure(self)
    }
}

extension NSObject: Apply { }
