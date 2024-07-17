//
//  UIView+Layout.swift
//  
//
//  Created by vijay yadav on 07/10/22.
//

import UIKit

public struct AnchoredConstraints {
    public var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

public enum Anchor {
    case top(_ top: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    case leading(_ leading: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    case bottom(_ bottom: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    case trailing(_ trailing: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    case topGreaterThanEquals(_ trailing: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    case leadingGreaterThanEquals(_ leading: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    case bottomGreaterThanEquals(_ leading: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    case trailingGreaterThanEquals(_ trailing: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    case height(_ constant: CGFloat)
    case heightGreaterThanEquals(_ constant: CGFloat)
    case width(_ constant: CGFloat)
}

public extension UIView {

    @discardableResult
    func anchor(_ anchors: Anchor...) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        anchors.forEach { anchor in
            switch anchor {
            case .top(let anchor, let constant):
                anchoredConstraints.top = topAnchor.constraint(equalTo: anchor, constant: constant)
            case .leading(let anchor, let constant):
                anchoredConstraints.leading = leadingAnchor.constraint(equalTo: anchor, constant: constant)
            case .bottom(let anchor, let constant):
                anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: anchor, constant: -constant)
            case .trailing(let anchor, let constant):
                anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: anchor, constant: -constant)
            case .height(let constant):
                if constant > 0 {
                    anchoredConstraints.height = heightAnchor.constraint(equalToConstant: constant)
                }
            case .width(let constant):
                if constant > 0 {
                    anchoredConstraints.width = widthAnchor.constraint(equalToConstant: constant)
                }
            case .heightGreaterThanEquals(let constant):
                anchoredConstraints.height = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
            case .topGreaterThanEquals(let anchor, let constant):
                anchoredConstraints.top = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            case .leadingGreaterThanEquals(let anchor, let constant):
                anchoredConstraints.leading = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            case .trailingGreaterThanEquals(let anchor, let constant):
                anchoredConstraints.trailing = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
            case .bottomGreaterThanEquals(let anchor, let constant):
                anchoredConstraints.bottom = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
            }
        }
        [anchoredConstraints.top,
         anchoredConstraints.leading,
         anchoredConstraints.bottom,
         anchoredConstraints.trailing,
         anchoredConstraints.width,
         anchoredConstraints.height].forEach {
            $0?.isActive = true
        }
        return anchoredConstraints
    }

    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {

        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()

        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }

        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }

        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }

        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }

        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }

        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }

        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }

        return anchoredConstraints
    }

    @discardableResult
    func fillSuperview(padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        let anchoredConstraints = AnchoredConstraints()
        guard let superviewTopAnchor = superview?.topAnchor,
            let superviewBottomAnchor = superview?.bottomAnchor,
            let superviewLeadingAnchor = superview?.leadingAnchor,
            let superviewTrailingAnchor = superview?.trailingAnchor else {
                return anchoredConstraints
        }

        return anchor(top: superviewTopAnchor, leading: superviewLeadingAnchor, bottom: superviewBottomAnchor, trailing: superviewTrailingAnchor, padding: padding)
    }

    @discardableResult
    func fillSuperviewSafeAreaLayoutGuide(padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        let anchoredConstraints = AnchoredConstraints()
        
        guard let superviewTopAnchor = superview?.safeAreaLayoutGuide.topAnchor,
              let superviewBottomAnchor = superview?.safeAreaLayoutGuide.bottomAnchor,
              let superviewLeadingAnchor = superview?.safeAreaLayoutGuide.leadingAnchor,
              let superviewTrailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor else {
            return anchoredConstraints
        }
        return anchor(top: superviewTopAnchor, leading: superviewLeadingAnchor, bottom: superviewBottomAnchor, trailing: superviewTrailingAnchor, padding: padding)
    }

    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }

        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }

        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }

        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }

    func centerXTo(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }

    func centerYTo(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }

    func centerXToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
    }

    func centerYToSuperview(_ constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor, constant: constant).isActive = true
        }
    }

    @discardableResult
    func constrainHeight(_ constant: CGFloat) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.height = heightAnchor.constraint(equalToConstant: constant)
        anchoredConstraints.height?.isActive = true
        return anchoredConstraints
    }

    @discardableResult
    func constrainWidth(_ constant: CGFloat) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.width = widthAnchor.constraint(equalToConstant: constant)
        anchoredConstraints.width?.isActive = true
        return anchoredConstraints
    }

    @discardableResult
    func constrainSize(_ size: CGSize) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        anchoredConstraints.width?.isActive = true
        anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        anchoredConstraints.height?.isActive = true
        return anchoredConstraints
    }

    func setupShadow(opacity: Float = 0, radius: CGFloat = 0, offset: CGSize = .zero, color: UIColor = Color.dropShadow) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }

    convenience init(backgroundColor: UIColor = .clear) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }

}

public extension UIView {
    func capsulised(radius: CGFloat? = nil, corners: UIRectCorner = [.allCorners]) {
        self.clipsToBounds = true
        guard let radius = radius else {
            let newRadius = self.bounds.size.height / 2
            self.layer.cornerRadius = newRadius
            return
        }
        var cornerMask = CACornerMask()
        if corners.contains(.topLeft) {
            cornerMask.insert(.layerMinXMinYCorner)
        }
        if corners.contains(.topRight) {
            cornerMask.insert(.layerMaxXMinYCorner)
        }
        if corners.contains(.bottomLeft) {
            cornerMask.insert(.layerMinXMaxYCorner)
        }
        if corners.contains(.bottomRight) {
            cornerMask.insert(.layerMaxXMaxYCorner)
        }
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = cornerMask
    }
    
    func applyShadow(shadowRadius: CGFloat = 8, shadowOpacity: Float = 0.10, shadowColor: CGColor = Color.dropShadow.cgColor, shadowOffset: CGSize = CGSize(width: 0, height: 5)) {
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = shadowOffset
        self.layer.masksToBounds = false
    }
    
}

public extension UIView {
    
    /// `wrapSuperView` will wrap the current view in new view and will add the constraints as per the insets
    /// insets passed in minus are treated as nil and this will skip to add the constraint for it
    func wrapInSuperview(_ inset: UIEdgeInsets? = nil) -> UIView {
        let view = UIView()
        view.addSubview(self)
        
        if let inset {
            if inset.top >= 0 {
                self.topAnchor.constraint(equalTo: view.topAnchor, constant: inset.top).isActive = true
            }
            if inset.left >= 0 {
                self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: inset.left).isActive = true
            }
            if inset.bottom >= 0 {
                self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset.bottom).isActive = true
            }
            if inset.right >= 0 {
                self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -inset.right).isActive = true
            }
            
            // add the center constraint if below conditions satisfy
            if inset.top < 0 && inset.bottom < 0 {
                NSLayoutConstraint.activate([
                    self.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    self.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 0),
                    self.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: 0)
                ])
            }
            if inset.left < 0 && inset.right < 0 {
                NSLayoutConstraint.activate([
                    self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    self.leftAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor, constant: 0),
                    self.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor, constant: 0)
                ])
            }
        }
        // add the constraint only if the values are greater than 0
        return view
    }
}

public extension UIView {
    func removeSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
}

extension CGRect {
    var topRight: CGPoint { CGPoint(x: maxX, y: minY) }
    var topLeft: CGPoint { CGPoint(x: minX, y: minY) }
    var bottomRight: CGPoint { CGPoint(x: maxX, y: maxY) }
    var bottomLeft: CGPoint { CGPoint(x: minX, y: maxY) }
}
