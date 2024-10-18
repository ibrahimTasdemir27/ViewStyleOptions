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
        }
    }
}
