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
