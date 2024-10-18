//
//  UIControl+Ext.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit
 
extension UIControl {
    func onTapGesture(action: (() -> Void)?) {
        self.addAction(UIAction() { _ in
            action?()
        }, for: .touchUpInside)
    }
}
