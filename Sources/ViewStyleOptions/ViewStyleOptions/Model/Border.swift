//
//  File.swift
//  
//
//  Created by İbrahim Taşdemir on 4.02.2025.
//

import UIKit

public struct Border {
    let size: CGFloat
    let color: UIColor
    
    public init(size: CGFloat, color: UIColor) {
        self.size = size
        self.color = color
    }
    
    public static let lightGray: Border = .init(size: 0.4, color: UIColor.darkGray)
}
