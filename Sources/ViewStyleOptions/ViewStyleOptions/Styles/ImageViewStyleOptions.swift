//
//  File.swift
//  
//
//  Created by İbrahim Taşdemir on 24.11.2024.
//

import UIKit

public enum ImageViewStyleOptions: ViewStyleOptionsApplier {
    case setImage(UIImage?)
    case setContentMode(UIImageView.ContentMode)
    case setTransitionAnimation(UIView.AnimationOptions, duration: TimeInterval, image: UIImage?)
    case setAspectRatio(CGFloat)
}

public extension ImageViewStyleOptions {
    typealias Target = UIImageView
    
    func apply(to target: UIImageView) {
        switch self {
        case .setImage(let image):
            target.image = image
        case .setContentMode(let contentMode):
            target.contentMode = contentMode
        case .setTransitionAnimation(let animationOptions, let duration, let image):
            UIView.transition(with: target, duration: duration) {
                target.image = image ?? target.image
            }
        case .setAspectRatio(let ratio):
            let aspectHeight = target.frame.width / ratio
            target.frame.size.height = aspectHeight
        }
    }
}
