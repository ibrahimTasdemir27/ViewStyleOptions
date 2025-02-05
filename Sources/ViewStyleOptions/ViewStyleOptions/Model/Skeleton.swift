//
//  File.swift
//  
//
//  Created by İbrahim Taşdemir on 4.02.2025.
//

import UIKit

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
        target.subviews.forEach { subview in
            apply(target: subview)
        }
        guard target.tag == 27 else { return }
        DispatchQueue.main.async {
            let gradient = CAGradientLayer()
            gradient.colors = colors.map(\.cgColor)
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            gradient.frame = target.bounds
            gradient.cornerRadius = target.layer.cornerRadius != 0 ? target.layer.cornerRadius : 8
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
}
