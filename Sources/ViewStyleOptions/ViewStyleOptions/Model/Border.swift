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
    public static let lightPremium: Border = .init(size: 0.6, color: .init(red: 255/255, green: 164/255, blue: 0/255, alpha: 1.0))
}

