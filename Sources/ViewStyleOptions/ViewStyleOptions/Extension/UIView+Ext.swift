//
//  UIView+Ext.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit

//MARK: -> UIGenerator
public extension UIEdgeInsets {
    init(single value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }
    
    init(horizontal value: CGFloat) {
        self.init(top: 0, left: value, bottom: 0, right: value)
    }
    
    init(vertical value: CGFloat) {
        self.init(top: value, left: 0, bottom: value, right: 0)
    }
    
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}

 
public extension UIView {
    convenience init(configs: ViewStyleOptions...) {
        self.init()
        configs.forEach({ $0.apply(to: self) })
    }
    
    convenience init(style: Theme.Style, and styles: [ViewStyleOptions] = []) {
        self.init()
        self.applyStyles(style.view + styles)
    }
    
    func applyStyles(_ styles: ViewStyleOptions...) {
        styles.forEach { $0.apply(to: self) }
    }
    
    func applyStyles(style: Theme.Style) {
        self.applyStyles(style.view)
    }
    
    func applyStyles(_ styles: [ViewStyleOptions]) {
        styles.forEach { $0.apply(to: self) }
    }
}

public extension UIButton {
    convenience init(configs: ViewStyleOptions..., special: ButtonViewStyleOptions...) {
        self.init()
        configs.forEach({ $0.apply(to: self) })
        special.forEach({ $0.apply(to: self) })
    }
    
    convenience init(configs: [ViewStyleOptions], special: [ButtonViewStyleOptions]) {
        self.init()
        configs.forEach({ $0.apply(to: self) })
        special.forEach({ $0.apply(to: self) })
    }
    
    convenience init(special: ButtonViewStyleOptions...) {
        self.init()
        special.forEach({ $0.apply(to: self) })
    }
    
    convenience init(style: Theme.ButtonStyle, and styles: [ButtonViewStyleOptions] = []) {
        self.init()
        self.applyStyles(style.view)
        self.applyStyles(style.special + styles)
    }
    
    func applyStyles(_ style: Theme.ButtonStyle) {
        self.applyStyles(style.view)
        self.applyStyles(style.special)
    }
    
    func applyStyles(_ styles: ButtonViewStyleOptions...) {
        styles.forEach { $0.apply(to: self) }
    }
    
    func applyStyles(_ styles: [ButtonViewStyleOptions]) {
        styles.forEach { $0.apply(to: self) }
    }

}

public extension UILabel {
    convenience init(configs: ViewStyleOptions..., special: LabelViewStyleOptions...) {
        self.init()
        configs.forEach({ $0.apply(to: self) })
        special.forEach({ $0.apply(to: self) })
    }
    
    convenience init(configs: [ViewStyleOptions], special: [LabelViewStyleOptions]) {
        self.init()
        configs.forEach({ $0.apply(to: self) })
        special.forEach({ $0.apply(to: self) })
    }
    
    convenience init(special: LabelViewStyleOptions...) {
        self.init()
        special.forEach({ $0.apply(to: self) })
    }
    
    convenience init(style: Theme.LabelStyle, and styles: [LabelViewStyleOptions] = []) {
        self.init()
        self.applyStyles(style.view)
        self.applyStyles(style.special + styles)
    }
    
    func applyStyles(_ style: Theme.LabelStyle) {
        self.applyStyles(style.view)
        self.applyStyles(style.special)
    }
    
    func applyStyles(_ styles: LabelViewStyleOptions...) {
        styles.forEach { $0.apply(to: self) }
    }
    
    func applyStyles(_ styles: [LabelViewStyleOptions]) {
        styles.forEach { $0.apply(to: self) }
    }
}


public extension UITextView {
    convenience init(configs: ViewStyleOptions..., special: TextViewStyleOptions...) {
        self.init()
        configs.forEach({ $0.apply(to: self) })
        special.forEach({ $0.apply(to: self) })
    }
    
    convenience init(configs: [ViewStyleOptions], special: [TextViewStyleOptions]) {
        self.init()
        configs.forEach({ $0.apply(to: self) })
        special.forEach({ $0.apply(to: self) })
    }
    
    convenience init(special: TextViewStyleOptions...) {
        self.init()
        special.forEach({ $0.apply(to: self) })
    }
    
    
    func applyStyles(_ styles: TextViewStyleOptions...) {
        styles.forEach { $0.apply(to: self) }
    }
    
    func applyStyles(_ styles: [TextViewStyleOptions]) {
        styles.forEach { $0.apply(to: self) }
    }
}


public extension UIImageView {
    convenience init(configs: ViewStyleOptions..., special: ImageViewStyleOptions...) {
        self.init()
        configs.forEach({ $0.apply(to: self) })
        special.forEach({ $0.apply(to: self) })
    }
    
    convenience init(configs: [ViewStyleOptions], special: [ImageViewStyleOptions]) {
        self.init()
        configs.forEach({ $0.apply(to: self) })
        special.forEach({ $0.apply(to: self) })
    }
    
    convenience init(special: ImageViewStyleOptions...) {
        self.init()
        special.forEach({ $0.apply(to: self) })
    }
    
    func applyStyles(_ styles: ImageViewStyleOptions...) {
        styles.forEach { $0.apply(to: self) }
    }
    
    func applyStyles(_ styles: [ImageViewStyleOptions]) {
        styles.forEach { $0.apply(to: self) }
    }
}


public extension CGSize {
    public static func size(_ square: CGFloat) -> CGSize {
        return CGSize.init(width: square, height: square)
    }
}
