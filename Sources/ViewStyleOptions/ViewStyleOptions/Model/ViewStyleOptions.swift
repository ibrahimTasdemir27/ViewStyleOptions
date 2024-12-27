//
//  ViewStyleOptions.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit
 
public protocol ViewStyleOptionsApplier {
    associatedtype Target: UIView
    func apply(to target: Target)
}

public struct Border {
    let size: CGFloat
    let color: UIColor
    
    public init(size: CGFloat, color: UIColor) {
        self.size = size
        self.color = color
    }
    
    public static let lightGray: Border = .init(size: 0.4, color: UIColor.darkGray)
}


public struct Shadow {
    let color: UIColor
    let opacity: Float
    let offset: CGSize
    let radius: CGFloat
    
    public init(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat) {
        self.color = color
        self.opacity = opacity
        self.offset = offset
        self.radius = radius
    }
    
    public static let defaultShadow = Shadow(color: .black, opacity: 0.1, offset: CGSize(width: 0, height: 0.5), radius: 15)
}

public struct Skeleton {
    let colors: [UIColor]
    let fromValue: Any?
    let toValue: Any?
    let duration: Double
    
    public static let colorful = Skeleton(
        colors: [
            .systemBlue,
            .systemPurple,
            .systemPink,
            .systemOrange,
            .systemYellow,
        ],
        fromValue: [-0.5, 0.0, 0.5, 1.0, 1.5],
        toValue: [0.5, 1.0, 1.5, 2.0, 2.5],
        duration: 2.0
    )
    
    public static let loadablecolor = Skeleton(
        colors: [
            UIColor(white: 0.9, alpha: 1.0),
            UIColor(white: 0.95, alpha: 1.0),
            UIColor(white: 0.9, alpha: 1.0)
        ],
        fromValue: [-0.5, 0.0, 0.5],
        toValue: [0.5, 1.0, 1.5],
        duration: 1.5
    )
    
    func apply(target: UIView) {
        let gradient = CAGradientLayer()
        gradient.colors = colors.map(\.cgColor)
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = target.bounds
        gradient.cornerRadius = target.layer.cornerRadius
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = duration
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        gradient.add(animation, forKey: "skeletonAnimation")
        target.layer.addSublayer(gradient)
    }
}

