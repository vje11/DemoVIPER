//
//  IntrinsicTextView.swift
//  
//
//  Created by vijay yadav on 11/03/23.
//

import UIKit

fileprivate var kTextViewLeftPadding: CGFloat = 5
fileprivate var kTextViewDefaultHeight: CGFloat = 24
fileprivate var kTextViewMaxHeight: CGFloat = 150

open class IntrinsicTextView: TextView {
    
    public var maxHeight: CGFloat = kTextViewMaxHeight

    open override var text: String! {
        willSet {
            calculateIntrinsicSize()
        }
    }

    open override var attributedText: NSAttributedString! {
        willSet {
            calculateIntrinsicSize()
        }
    }
    
    open override var intrinsicContentSize: CGSize {
        let fixedWidth = self.frame.size.width
        let newSize = self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        return CGSize(width: max(newSize.width, fixedWidth), height: calculateHeight(forNewHeight: newSize.height))
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public override func setup() {
        super.setup()
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChangedNotification), name: UITextView.textDidChangeNotification, object: nil)
    }

    private func calculateIntrinsicSize() {
        invalidateIntrinsicContentSize()
        self.contentInset = UIEdgeInsets(top: 0, left: kTextViewLeftPadding, bottom: 0, right: kTextViewLeftPadding)
        self.layoutIfNeeded()
    }
    
    private func calculateHeight(forNewHeight height: CGFloat) -> CGFloat {
        let maxHeight = height > maxHeight ? maxHeight : height
        return maxHeight < kTextViewDefaultHeight ? kTextViewDefaultHeight : maxHeight
    }
    
}

extension IntrinsicTextView {
    
    @objc
    private func textDidChangedNotification(_ notif: Notification) {
        guard let textView = notif.object as? UITextView, self == textView else {
            return
        }
        calculateIntrinsicSize()
    }
}
