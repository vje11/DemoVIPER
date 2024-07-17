//
//  UIView+Stack.swift
//
//
//  Created by vijay yadav on 07/10/22.
//

import UIKit

public extension UIView {
    fileprivate func _stack(_ axis: NSLayoutConstraint.Axis = .vertical, views: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)
        if #available(iOS 11.0, *) {
            stackView.fillSuperview()
        } else {
            stackView.anchor()
        }
        return stackView
    }
    
    @discardableResult
    func addStackView(_ axis: NSLayoutConstraint.Axis = .vertical, views: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, pinToAllSides: Bool = true) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)
        if pinToAllSides {
            if #available(iOS 11.0, *) {
                stackView.fillSuperview()
            } else {
                stackView.anchor()
            }
        }
        return stackView
    }
    
    @discardableResult
    func vstack(_ views: UIView..., spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.vertical, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
    @discardableResult
    func hstack(_ views: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.horizontal, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
    @discardableResult
    func hstack(_ views: UIView..., spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.horizontal, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
    @discardableResult
    func withSize<T: UIView>(_ size: CGSize) -> T {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self as! T
    }
    
    @discardableResult
    func withHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    func withWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    func withBorder<T: UIView>(width: CGFloat, color: UIColor) -> T {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return self as! T
    }
}

public extension CGSize {
    static func equalEdge(_ edge: CGFloat) -> CGSize {
        return .init(width: edge, height: edge)
    }
}

public extension UIView {
    
    func addSubViews(_ views: [UIView]) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
    
    func wrap(inset: UIEdgeInsets = .zero) -> UIView {
        let containerView = UIView().apply { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        containerView.addSubview(self)
        
        if inset.top >= 0 {
            self.topAnchor.constraint(equalTo: containerView.topAnchor, constant: inset.top).isActive = true
        }
        if inset.left >= 0 {
            self.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: inset.left).isActive = true
        }
        if inset.right >= 0 {
            self.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -inset.right).isActive = true
        }
        if inset.bottom >= 0 {
            self.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -inset.bottom).isActive = true
        }
        
        return containerView
    }
    
    // MARK: Styling
    
    func borderAndCorner(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor?) {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        
        let sublayer = CALayer()
        sublayer.backgroundColor = UIColor.red.cgColor
        sublayer.mask = mask
        
        layer.addSublayer(sublayer)
    }
    
    /// Adds a border with rounded corners to the view.
    ///
    /// - Parameters:
    ///   - sides: The sides on which to add the border. Defaults to all sides.
    ///   - color: The color of the border. Defaults to Color.border.
    ///   - thickness: The thickness of the border. Defaults to 1.0.
    ///   - radius: The radius of the rounded corners. Defaults to 8.
    func addBorderWithCornerRadius(sides: [UIRectEdge] = [.all], color: UIColor = Color.border, thickness: CGFloat = 1.0, radius: CGFloat = 8) {
        // Remove existing layers with the same name
        self.layer.sublayers?.filter { $0.name == "BorderAndRadiusLayer" }.forEach { $0.removeFromSuperlayer() }
        
        // Create a mutable path
        let path = CGMutablePath()
        
        // Move to the starting point (bottom-left corner)
        if sides.contains(.bottom) || sides.contains(.all) {
            var startPoint = bounds.bottomLeft
            startPoint.y -= radius
            path.move(to: startPoint)
        } else {
            path.move(to: bounds.bottomLeft)
        }
        
        // Add arcs and lines based on specified sides
        if sides.contains(.left) || sides.contains(.all) {
            // Rounded top-left corner
            let radius = sides.contains(.top) ? radius : .zero
            path.addArc(tangent1End: bounds.topLeft, tangent2End: bounds.topRight, radius: radius)
        } else {
            path.move(to: bounds.topLeft)
        }
        
        if sides.contains(.top) || sides.contains(.all) {
            // Rounded top-right corner
            let radius = sides.contains(.right) ? radius : .zero
            path.addArc(tangent1End: bounds.topRight, tangent2End: bounds.bottomRight, radius: radius)
        } else {
            path.move(to: bounds.topRight)
        }
        
        if sides.contains(.right) || sides.contains(.all) {
            // Line to bottom-right corner
            let radius = sides.contains(.bottom) ? radius : .zero
            path.addArc(tangent1End: bounds.bottomRight, tangent2End: bounds.bottomLeft, radius: radius)
        } else {
            path.move(to: bounds.bottomRight)
        }
        
        if sides.contains(.bottom) || sides.contains(.all) {
            // Line to bottom-left corner
            let radius = sides.contains(.left) ? radius : .zero
            path.addArc(tangent1End: bounds.bottomLeft, tangent2End: bounds.topLeft, radius: radius)
        }
        
        // Create a shape layer for the path
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = "BorderAndRadiusLayer"
        shapeLayer.path = path
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = thickness
        
        // Set masked corners and corner radius
        shapeLayer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        shapeLayer.cornerRadius = radius
        
        // Add the shape layer to the view's layer
        layer.addSublayer(shapeLayer)
    }
}
