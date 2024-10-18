//
//  ViewStyles.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit

enum ViewStyleOptions {
    case setBorder(Border)
    case setRadius(CGFloat)
    case setBackground(UIColor)
    case setTint(UIColor)
    case setShadow(Shadow)
    case setAlpha(CGFloat)
    case setSize(CGSize)
    case addSubviews([UIView])
    
}


extension ViewStyleOptions: ViewStyleOptionsApplier {
    typealias Target = UIView
    
    func apply(to target: UIView) {
        switch self {
        case .setBorder(let border):
            target.layer.borderWidth = border.size
            target.layer.borderColor = border.color.cgColor
        case .setRadius(let radius):
            target.clipsToBounds = true
            target.layer.cornerRadius = radius
        case .setBackground(let uIColor):
            target.backgroundColor = uIColor
        case .setTint(let uIColor):
            target.tintColor = uIColor
        case .setShadow(let shadow):
            target.clipsToBounds = true
            target.backgroundColor = .white
            target.layer.shadowColor = shadow.color.cgColor
            target.layer.shadowOpacity = shadow.opacity
            target.layer.shadowOffset = shadow.offset
            target.layer.shadowRadius = shadow.radius
            target.layer.masksToBounds = false
        case .setAlpha(let alpha):
            target.alpha = alpha
        case .setSize(let size):
            NSLayoutConstraint.activate([
                target.heightAnchor.constraint(equalToConstant: size.height),
                target.widthAnchor.constraint(equalToConstant: size.width)
            ])
        case .addSubviews(let subviews):
            subviews.forEach { subview in
                target.addSubview(subview)
            }
        }
    }
}
