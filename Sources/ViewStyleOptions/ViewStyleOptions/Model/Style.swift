//
//  File.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 22.11.2025.
//

import Foundation

public enum Theme {
    
    public class Style {
        public let view: [ViewStyleOptions]
        
        public init(view: [ViewStyleOptions]) {
            self.view = view
        }
    }
    
    public class ButtonStyle: Style {
        public let special: [ButtonViewStyleOptions]
        
        public init(view: [ViewStyleOptions], special: [ButtonViewStyleOptions]) {
            self.special = special
            super.init(view: view)
        }
        
        public static func generate(_ style: ButtonStyle,
                             configs: [ViewStyleOptions] = [], special: [ButtonViewStyleOptions] = []) -> ButtonStyle {
            let newStyle = ButtonStyle.init(view: style.view + configs, special: style.special + special)
            return newStyle
        }
    }
    
    public class LabelStyle: Style {
        public let special: [LabelViewStyleOptions]
        
        public init(view: [ViewStyleOptions] = [], special: [LabelViewStyleOptions]) {
            self.special = special
            super.init(view: view)
        }
    }
    
}
