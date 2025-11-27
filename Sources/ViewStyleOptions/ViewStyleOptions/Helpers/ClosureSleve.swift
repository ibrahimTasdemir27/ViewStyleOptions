//
//  File.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 24.11.2025.
//

import Foundation

public class ClosureSleeve {
    let closure: (() -> Void)?

    init(_ closure: (() -> Void)?) {
        self.closure = closure
    }

    @objc func invoke() {
        closure?()
    }
}
