//
//  TLabel.swift
//  
//
//  Created by vijay yadav on 06/10/22.
//

import UIKit

/// `Tlabel`: a custom label with default font and color specifications to display the text.
/// `LabelColor`: text color value in the string
@IBDesignable
open class TLabel: UILabel {

    // MARK: Configurable Properties
    @IBInspectable public var topInset: CGFloat = 0.0
    @IBInspectable public var bottomInset: CGFloat = 0.0
    @IBInspectable public var leftInset: CGFloat = 0.0
    @IBInspectable public var rightInset: CGFloat = 0.0

    @IBInspectable var LabelColor: String? {
        willSet {
            if let newColor = UIColor(named: newValue ?? "") {
                self.textColor = newColor
            }
        }
    }

    fileprivate var oldtext: String?

    open override var text: String? {
        willSet {
            oldtext = text
        }

        didSet {
            guard let newText = text else {
                return
            }

            if oldtext != newText {
                self.text = NSLocalizedString(newText, comment: "localised version of the label text")
            }
        }
    }

    // MARK: Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        if let currentText = text {
            self.text = currentText
        }
    }
    
    private func initializeLabel() {
        if LabelColor == nil {
            self.textColor = Color.Text.heading
        }
    }

}

// MARK: Extensions
public extension TLabel {
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
