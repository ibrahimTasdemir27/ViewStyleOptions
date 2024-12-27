//
//  String+Ext.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import Foundation


public extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}

