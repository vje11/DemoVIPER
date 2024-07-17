//
//  String+Extension.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//

import Foundation

public extension String {
    func generateAttributedStringWithLink(linkText: [String], linkURL: [String]) -> NSAttributedString {
        let fullText = self
        let attributedString = NSMutableAttributedString(string: fullText)
        for (idx, text) in linkText.enumerated() {
            if let linkRange = fullText.range(of: text), linkURL.indices.contains(idx) {
                let linkUrlText = linkURL[idx]
                let nsRange = NSRange(linkRange, in: fullText)
                attributedString.addAttribute(.link, value: URL(string: linkUrlText)!, range: nsRange)
            }
        }
        
        return attributedString
    }
}
