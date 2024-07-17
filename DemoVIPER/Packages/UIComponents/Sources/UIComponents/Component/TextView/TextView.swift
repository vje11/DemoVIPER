//
// TextView.swift
//
//
// Created by vijay yadav on 30/05/23.
//

import UIKit

open class TextView: UITextView {
    enum Constants {
        static var backgroundColor: UIColor { TextFieldConstants.Colors.backgroundColor }
        static var textColor: UIColor { TextFieldConstants.Colors.textColor }
        static var placeholderTextColor: UIColor { Color.Grey.grey50 }
        static var outerBorderColor: UIColor { TextFieldConstants.Colors.outerBorderColor }
        static var textFont: UIFont? = UIFont.systemFont(ofSize: 12)
        static var placeholderFont: UIFont? = UIFont.systemFont(ofSize: 12)
    }
    
    override open var text: String? {
        set {
            super.text = newValue
        }
        get {
            return super.text == placeholder ? "" : super.text
        }
    }
    
    open var placeholder: String = "" {
        didSet {
            updateTextStyle(self.text == "")
        }
    }
    
    open var showBorder: Bool = false {
        didSet {
            self.layer.borderColor = Constants.outerBorderColor.cgColor
            self.layer.borderWidth = showBorder ? 1 : 0
            self.layer.cornerRadius = 4
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public func setup() {
        registerForNotifications()
        applyDefaultSettings()
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(textDidStartEditingNotification), name: UITextView.textDidBeginEditingNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textDidFinishEditingNotification), name: UITextView.textDidEndEditingNotification, object: nil)
    }
    
    private func applyDefaultSettings() {
        self.backgroundColor = Constants.backgroundColor
        self.textColor = Constants.textColor
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension TextView {
    
    private func updateTextStyle(_ isPlaceholderVisible: Bool) {
        if isPlaceholderVisible { self.text = placeholder }
        self.textColor = isPlaceholderVisible ? Constants.placeholderTextColor : Constants.textColor
        self.font = isPlaceholderVisible ? Constants.placeholderFont : Constants.textFont
    }
    
    @objc
    private func textDidStartEditingNotification(_ notif: Notification) {
        guard let textView = notif.object as? UITextView, self == textView else {
            return
        }
        if super.text == placeholder {
            self.text = ""
            updateTextStyle(false)
        }
    }
    
    @objc
    private func textDidFinishEditingNotification(_ notif: Notification) {
        guard let textView = notif.object as? UITextView, self == textView else {
            return
        }
        if super.text == "" {
            updateTextStyle(true)
        }
    }
}

public extension TextView {
    func addAttachment(_ image: UIImage) {
        let attachment = NSTextAttachment(image: image)
        if let cgImage = image.cgImage {
            let imgWidth = image.size.width
            attachment.image = UIImage(cgImage: cgImage,
                                       scale: imgWidth/self.frame.width,
                                       orientation: .up)
        }
        let attibutedStringWithImage = NSAttributedString(attachment: attachment)
        self.textStorage.insert(attibutedStringWithImage, at: self.selectedRange.location)
    }
}


public enum TextFieldConstants {
    enum Dimension {
        static let indicatorLineHeight: CGFloat = 2
        
        static let cornerRadius: CGFloat = 8
    }
    
    public enum Colors {
        
        public static var tintColor: UIColor {
            return Color.Grey.grey90
        }
        
        public static var outerBorderColor: UIColor {
            return Color.Grey.grey40
        }
        
        public static var backgroundColor: UIColor {
            return Color.Background.primary
        }
        
        public static var textColor: UIColor {
            return Color.Text.heading
        }
        
        public static var titleDefaultTextColor: UIColor {
            return Color.Text.paragraph
        }
        
        public static var titleFocusTextColor: UIColor {
            return Color.Text.paragraph
        }
        
        public static var titleActiveTextColor: UIColor {
            return Color.Text.paragraph
        }
        
        public static var helperTextColor: UIColor {
            return Color.Blue.blue60
        }
        
        public static var dividerDefaultColor: UIColor {
            return Color.Grey.grey40
        }
        
        public static var dividerFocusColor: UIColor {
            return Color.Blue.blue60
        }
        
        public static var prefixTextColor: UIColor {
            return Color.Grey.grey90
        }
        
        public static var suffixTextColor: UIColor {
            return Color.Grey.grey90
        }
    }
}
