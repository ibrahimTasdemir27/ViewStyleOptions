//
//  File.swift
//  ViewStyleOptions
//
//  Created by İbrahim Taşdemir on 22.11.2025.
//

import Foundation
import UIKit

public enum Dimens {

    // MARK: - Radius
    public enum Radius {
        case XS, S, M, L, XL, XXL, XXXL
        
        public var value: CGFloat {
            switch self {
            case .XS:   return 4
            case .S:    return 8
            case .M:    return 12
            case .L:    return 16
            case .XL:   return 20
            case .XXL:  return 24
            case .XXXL: return 32
            }
        }
    }

    // MARK: - Border
    public enum Border {
        case S, M, L, XL
        
        public var size: CGFloat {
            switch self {
            case .S:    return 1
            case .M:    return 2
            case .L:    return 3.5
            case .XL:   return 5
            }
        }
    }

    // MARK: - Spacing
    public enum Spacing {
        case XS, S, M, L, XL, XXL, XXXL
        
        public var value: CGFloat {
            switch self {
            case .XS:   return 4
            case .S:    return 8
            case .M:    return 12
            case .L:    return 16
            case .XL:   return 24
            case .XXL:  return 32
            case .XXXL: return 48
            }
        }
    }

    // MARK: - Font Size (opsiyonel ek)
    public enum FontSize {
        case XXXS, XXS, XS, S, M, L, XL, XXL, XXXL, XXXXL
        
        public var value: CGFloat {
            switch self {
            case .XXXS:     return 10
            case .XXS:      return 12
            case .XS:       return 14
            case .S:        return 16
            case .M:        return 28
            case .L:        return 22
            case .XL:       return 26
            case .XXL:      return 35
            case .XXXL:     return 40
            case .XXXXL:    return 50
            }
        }
    }
}
