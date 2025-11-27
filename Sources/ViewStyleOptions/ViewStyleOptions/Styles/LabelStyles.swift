//
//  LabelStyles.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit

public enum LabelViewStyleOptions: ViewStyleOptionsApplier {
    case setText(String?)
    case setFont(UIFont)
    case setSize(CGFloat)
    case setTextColor(UIColor)
    case setAligment(NSTextAlignment)
    case set0Line
    case setGesture(handler: (() -> Void)?)
}

public extension LabelViewStyleOptions {
    typealias Target = UILabel
    func apply(to target: UILabel) {
        
        switch self {
        case .setText(let string):
            target.text = string?.localized
        case .setFont(let uIFont):
            target.font = uIFont
        case .setSize(let size):
            target.font = target.font.withSize(size)
        case .setTextColor(let color):
            target.textColor = color
        case .setAligment(let aligment):
            target.textAlignment = aligment
        case .set0Line:
            target.numberOfLines = 0
        case .setGesture(let handler):
            target.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: ClosureSleeve(handler), action: #selector(ClosureSleeve.invoke))
            target.addGestureRecognizer(tap)
        }
    }
}
