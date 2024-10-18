//
//  ButtonStyles.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit

enum ButtonViewStyleOptions {
    case setTitle(String?)
    case setTitleColor(UIColor)
    case setImage(UIImage?)
    case setContentInset(UIEdgeInsets)
    case setFont(UIFont)
    case setAction((() -> Void)?)
}

extension ButtonViewStyleOptions: ViewStyleOptionsApplier {
    typealias Target = UIButton
    func apply(to target: UIButton) {
        switch self {
        case .setTitle(let string):
            target.setTitle(string?.localized, for: .normal)
        case .setTitleColor(let color):
            target.setTitleColor(color, for: .normal)
        case .setImage(let image):
            target.setImage(image, for: .normal)
        case .setContentInset(let uIEdgeInsets):
            target.contentEdgeInsets = uIEdgeInsets
        case .setFont(let uIFont):
            target.titleLabel?.font = uIFont
        case .setAction(let action):
            target.onTapGesture {
                action?()
            }
        }
    }
}
