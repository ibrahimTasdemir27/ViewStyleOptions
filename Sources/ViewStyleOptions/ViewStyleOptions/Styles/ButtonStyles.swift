//
//  ButtonStyles.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit
import SnapKit
 
public enum ButtonViewStyleOptions: ViewStyleOptionsApplier {
    case setTitle(String?)
    case setTitleColor(UIColor?)
    case setImage(UIImage?, aligment: UIControl.ContentHorizontalAlignment = .center)
    case setContentInset(UIEdgeInsets)
    case setDrawableSize(CGSize)
    case setIconSize(CGSize)
    case setFont(UIFont)
    case setFontSize(CGFloat)
    case set0Line
    case setTextAligment(NSTextAlignment)
    case setAction((() -> Void)?, animation: [VAnimation]? = nil)
}

public extension ButtonViewStyleOptions {
    typealias Target = UIButton
    func apply(to target: UIButton) {
        switch self {
        case .setTitle(let string):
            target.setTitle(string?.localized, for: .normal)
        case .setTitleColor(let color):
            target.setTitleColor(color, for: .normal)
        case .setImage(let image, let aligment):
            target.setImage(image, for: .normal)
            switch aligment {
            case .left:
                target.semanticContentAttribute = .forceLeftToRight
                target.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 8)
                target.titleEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 0)

            case .right:
                // image sağda, title solda
                target.semanticContentAttribute = .forceRightToLeft
                target.imageEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 0)
                target.titleEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 8)

            case .center:
                // image ortada, title yok ya da önemli değil
                target.semanticContentAttribute = .unspecified
                target.titleEdgeInsets = .zero
                target.imageEdgeInsets = .zero
            default: break
            }


        case .setContentInset(let uIEdgeInsets):
            target.contentEdgeInsets = uIEdgeInsets
        case .setDrawableSize(let size):
            target.imageView?.snp.makeConstraints { make in
                make.size.equalTo(size)
                make.centerY.equalToSuperview()
                make.trailing.equalTo(target.titleLabel!.snp.leading).inset(2)
                
            }
        case .setIconSize(let size):
            target.imageView?.snp.makeConstraints { make in
                make.size.equalTo(size)
                make.centerY.equalToSuperview()
            }
        case .setFont(let uIFont):
            target.titleLabel?.font = uIFont
        case .setFontSize(let size):
            target.titleLabel?.applyStyles(.setSize(size))
        case .set0Line:
            target.titleLabel?.applyStyles(.set0Line)
        case .setTextAligment(let aligment):
            target.titleLabel?.applyStyles(.setAligment(aligment))
        case .setAction(let action, let animation):
            target.onTapGesture {
                action?()
                animation?.forEach({
                    $0.apply(to: target)
                })
            }
        }
    }
}


import UIKit

public enum VAnimation {
    case bounce
    case shake
    case fadeIn
    case fadeOut
    case rotate(angle: CGFloat, duration: Double, autoReversed: Bool)
    case spring
    case flip(axis: Axis, duration: Double)
    case pulse
    case wobble
    case zoomIn
    case zoomOut
    
    public enum Axis {
        case x, y
    }

    func apply(to target: UIView) {
        switch self {
        case .bounce:
            bounce(to: target)
        case .shake:
            shake(to: target)
        case .fadeIn:
            fade(to: target, alpha: 1.0)
        case .fadeOut:
            fade(to: target, alpha: 0.0)
        case .rotate(let angle, let duration, let autoReversed):
            rotate(to: target, angle: angle, duration: duration, autoReversed: autoReversed)
        case .spring:
            spring(to: target)
        case .flip(let axis, let duration):
            flip(to: target, axis: axis, duration: duration)
        case .pulse:
            pulse(to: target)
        case .wobble:
            wobble(to: target)
        case .zoomIn:
            zoom(to: target, scale: 1.2)
        case .zoomOut:
            zoom(to: target, scale: 0.8)
        }
    }
    
    private func bounce(to target: UIView, duration: Double = 0.4) {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1.0, 1.2, 0.9, 1.0]
        animation.keyTimes = [0.0, 0.3, 0.6, 1.0]
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        target.layer.add(animation, forKey: "bounce")
    }

    private func shake(to target: UIView, duration: Double = 0.5) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.values = [-10, 10, -8, 8, -5, 5, 0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 0.9, 1]
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        target.layer.add(animation, forKey: "shake")
    }

    private func fade(to target: UIView, alpha: CGFloat, duration: Double = 0.3) {
        UIView.animate(withDuration: duration) {
            target.alpha = alpha
        }
    }

    private func rotate(to target: UIView, angle: CGFloat, duration: Double, autoReversed: Bool) {
        UIView.animate(withDuration: duration) {
            target.transform = CGAffineTransform(rotationAngle: angle)
        } completion: { _ in
            if autoReversed {
                target.transform = .identity
            }
        }
    }

    private func spring(to target: UIView) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            target.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                target.transform = .identity
            }
        }
    }

    private func flip(to target: UIView, axis: Axis, duration: Double) {
        let transition = CATransition()
        transition.type = CATransitionType(rawValue: "flip")
        transition.subtype = axis == .x ? .fromLeft : .fromTop
        transition.duration = duration
        target.layer.add(transition, forKey: "flip")
    }

    private func pulse(to target: UIView) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.0
        animation.toValue = 1.1
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = .greatestFiniteMagnitude
        target.layer.add(animation, forKey: "pulse")
    }

    private func wobble(to target: UIView) {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
        animation.values = [-0.1, 0.1, -0.08, 0.08, -0.05, 0.05, 0.0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 0.9, 1]
        animation.duration = 0.5
        target.layer.add(animation, forKey: "wobble")
    }

    private func zoom(to target: UIView, scale: CGFloat) {
        UIView.animate(withDuration: 0.3, animations: {
            target.transform = CGAffineTransform(scaleX: scale, y: scale)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                target.transform = .identity
            }
        }
    }
}
