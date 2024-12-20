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

