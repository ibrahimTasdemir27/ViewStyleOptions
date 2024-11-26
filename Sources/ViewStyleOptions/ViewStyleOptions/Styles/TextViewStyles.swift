//
//  File.swift
//  
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit

public enum TextViewStyleOptions: ViewStyleOptionsApplier {
    case setText(String?)
    case setFont(UIFont)
    case setTextColor(UIColor)
    case setAligment(NSTextAlignment)
    case setEditable(Bool)
    case setContentInset(UIEdgeInsets)
    case setScrollEnabled(Bool)
    case setLineSpacing(CGFloat)
    case setZeroInset
}

public extension TextViewStyleOptions {
    typealias Target = UITextView
    func apply(to target: UITextView) {
        switch self {
        case .setText(let string):
            target.text = string?.localized
        case .setFont(let uIFont):
            target.font = uIFont
        case .setTextColor(let color):
            target.textColor = color
        case .setAligment(let aligment):
            target.textAlignment = aligment
        case .setEditable(let editable):
            target.isEditable = editable
        case .setContentInset(let edgeInset):
            target.contentInset = edgeInset
        case .setScrollEnabled(let isEnabled):
            target.isScrollEnabled = isEnabled
        case .setLineSpacing(let spacing):
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = spacing
            let attributed = NSMutableAttributedString(string: target.text)
            attributed.addAttribute(.paragraphStyle, value: attributed, range: NSMakeRange(0, attributed.length))
            target.attributedText = attributed
        case .setZeroInset:
            target.textContainer.lineFragmentPadding = 0
            target.textContainerInset = .zero
            target.contentInset = .zero
        }
    }
}

