//
//  File.swift
//  
//
//  Created by İbrahim Taşdemir on 4.02.2025.
//

import UIKit

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
 
