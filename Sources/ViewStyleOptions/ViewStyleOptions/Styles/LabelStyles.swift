//
//  LabelStyles.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit

enum LabelViewStyleOptions {
    case setText(String?)
    case setFont(UIFont)
    case setTextColor(UIColor)
    case setAligment(NSTextAlignment)
    case set0Line
}

extension LabelViewStyleOptions: ViewStyleOptionsApplier {
    typealias Target = UILabel
    func apply(to target: UILabel) {
        
        switch self {
        case .setText(let string):
            target.text = string?.localized
        case .setFont(let uIFont):
            target.font = uIFont
        case .setTextColor(let color):
            target.textColor = color
        case .setAligment(let aligment):
            target.textAlignment = aligment
        case .set0Line:
            target.numberOfLines = 0
        }
    }
}
