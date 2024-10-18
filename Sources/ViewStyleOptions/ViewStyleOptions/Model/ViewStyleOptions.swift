//
//  ViewStyleOptions.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit

protocol ViewStyleOptionsApplier {
    associatedtype Target: UIView
    func apply(to target: Target)
}

struct Border {
    let size: CGFloat
    let color: UIColor
    
    static let lightGray: Border = .init(size: 0.4, color: UIColor.darkGray)
}


struct Shadow {
    let color: UIColor
    let opacity: Float
    let offset: CGSize
    let radius: CGFloat
    
    static let defaultShadow = Shadow(color: .black, opacity: 0.1, offset: CGSize(width: 0, height: 0.5), radius: 15)
}

