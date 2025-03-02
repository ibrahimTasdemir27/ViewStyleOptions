//
//  File.swift
//
//
//  Created by İbrahim Taşdemir on 4.02.2025.
//

import UIKit

public class HGradient: NSObject {
    let startPoint: CGPoint
    let endPoint: CGPoint
    let colors: [UIColor]
    let locations: [NSNumber]?
    let type: CAGradientLayerType
    let animation: TransitionAnimation?
    let otherAnimations: [CABasicAnimation]
    
    public struct TransitionAnimation {
        let colors: [UIColor]
        let duration: Double
        let autoreverses: Bool
        let repeatCount: Float
        
        public init(colors: [UIColor], duration: Double, autoreverses: Bool = true, repeatCount: Float = .infinity) {
            self.colors = colors
            self.duration = duration
            self.autoreverses = autoreverses
            self.repeatCount = repeatCount
        }
    }
    
    public init(startPoint: CGPoint = .zero, endPoint: CGPoint = .init(x: 1, y: 1),
                colors: [UIColor], locations: [NSNumber]? = [0, 1], type: CAGradientLayerType = .axial,
                animation: TransitionAnimation? = nil, otherAnimations: [CABasicAnimation] = []) {
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.colors = colors
        self.locations = locations
        self.type = type
        self.animation = animation
        self.otherAnimations = otherAnimations
    }
    
    public convenience init(gradient: GradientExample, animation: AnimationType?) {
        self.init(
            startPoint: gradient.gradient.startPoint,
            endPoint: gradient.gradient.endPoint,
            colors: gradient.gradient.colors,
            locations: gradient.gradient.locations,
            type: gradient.gradient.type,
            animation: gradient.gradient.animation,
            otherAnimations: animation != nil ? [animation!.animation] : gradient.gradient.otherAnimations
        )
    }
    
    public convenience init(gradient: HGradient, animation: AnimationType?) {
        self.init(
            startPoint: gradient.startPoint,
            endPoint: gradient.endPoint,
            colors: gradient.colors,
            locations: gradient.locations,
            type: gradient.type,
            animation: gradient.animation,
            otherAnimations: animation != nil ? [animation!.animation] : gradient.otherAnimations
        )
    }
    
    func apply(to target: UIView) {
        let layer = CAGradientLayer()
        layer.frame = target.bounds
        layer.colors = colors.map { $0.cgColor }
        layer.startPoint = startPoint
        layer.endPoint = endPoint
        layer.locations = locations
        layer.type = type
        target.layer.insertSublayer(layer, at: 0)
        
        
        if let animation {
            let colorAnimation = CABasicAnimation(keyPath: "colors")
            colorAnimation.fromValue = colors.map { $0.cgColor }
            colorAnimation.toValue = animation.colors.map(\.cgColor)
            colorAnimation.duration = animation.duration
            colorAnimation.autoreverses = animation.autoreverses
            colorAnimation.repeatCount = animation.repeatCount
            colorAnimation.fillMode = .forwards
            colorAnimation.isRemovedOnCompletion = false
            layer.add(colorAnimation, forKey: "colorGradientAnimation")
        }
        
        
        otherAnimations.forEach {
            layer.add($0, forKey: nil)
        }
    }
    
    deinit {
        print("Hello, I'm deinit: ViewStyleOptions.HGradient")
    }
    
    static public let peach = UIColor(red: 1.0, green: 0.83, blue: 0.61, alpha: 1.0)
    static public let lavender = UIColor(red: 0.9, green: 0.9, blue: 1.0, alpha: 1.0)
    static public let fuchsia = UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0)
    static public let mint = UIColor(red: 0.67, green: 1.0, blue: 0.77, alpha: 1.0)
}


public extension HGradient {
    indirect enum GradientExample: String, Codable {
        case midnightShadow
        case bronzeEclipse
        case deepOcean
        case silverMist
        case softGlow
        case reversedSoftGlow
        case mintBreeze
        case reversedMintBreeze
        
        case coralSunset
        case roseFusion
        case violetDream
        case crimsonPulse
        case skyTwilight
        case arcticWave
        
        case tropicalBloom
        case aquaForest
        case limeLagoon
        case goldenDusk
        case peachFizz
        case sunsetPop
        
        case sunset
        case oceanBreeze
        case peachy
        case lavenderMist
        case nightSky
        case pinkDream
        case autumnLeaves
        case mintyFresh
        case galaxy
        
        case darkForest
        case freshSpring
        case deepForest
        case gardenGlow
        case dayAndNight
        
        case naturalRenewal
        case forestFresh
        case softGrass
        case underTheShade
        case freshSpringBreeze
        case endlessSpring
        case risingLeaves
        case mysticForest
        
        public static func withAxis(axis: GradientLayerType, gradient: GradientExample) -> HGradient {
            return .init(
                startPoint: axis.startPoint(),
                endPoint: axis.endPoint(),
                colors: gradient.gradient.colors,
                locations: gradient.gradient.locations,
                type: gradient.gradient.type,
                animation: gradient.gradient.animation,
                otherAnimations: gradient.gradient.otherAnimations
            )
        }
        
        public var gradient: HGradient {
            switch self {
            case .midnightShadow:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0),
                        .init(red: 115.0 / 255.0, green: 115.0 / 255.0, blue: 115.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .bronzeEclipse:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0),
                        .init(red: 200.0 / 255.0, green: 145.0 / 255.0, blue: 23.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .deepOcean:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0),
                        .init(red: 53.0 / 255.0, green: 51.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .silverMist:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 166.0 / 255.0, green: 166.0 / 255.0, blue: 166.0 / 255.0, alpha: 1.0),
                        .init(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
                    ],
                    locations: [0, 1]
                )
            case .softGlow:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 255.0 / 255.0, green: 247.0 / 255.0, blue: 174.0 / 255.0, alpha: 1.0),
                        .init(red: 255.0 / 255.0, green: 169.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0),
                    ],
                    locations: [0, 1]
                )
            case .reversedSoftGlow:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 255.0 / 255.0, green: 169.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0),
                        .init(red: 255.0 / 255.0, green: 247.0 / 255.0, blue: 174.0 / 255.0, alpha: 1.0),
                    ],
                    locations: [0, 1]
                )
            case .mintBreeze:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 205.0 / 255.0, green: 255.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0),
                        .init(red: 147.0 / 255.0, green: 185.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .reversedMintBreeze:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 147.0 / 255.0, green: 185.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
                        .init(red: 205.0 / 255.0, green: 255.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0),
                    ],
                    locations: [0, 1]
                )
            case .coralSunset:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 255.0 / 255.0, green: 49.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0),
                        .init(red: 255.0 / 255.0, green: 145.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .roseFusion:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 255.0 / 255.0, green: 87.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0),
                        .init(red: 140.0 / 255.0, green: 82.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .violetDream:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 82.0 / 255.0, green: 112.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
                        .init(red: 255.0 / 255.0, green: 102.0 / 255.0, blue: 196.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .crimsonPulse:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 10.0 / 255.0, green: 151.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0),
                        .init(red: 123.0 / 255.0, green: 217.0 / 255.0, blue: 87.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .skyTwilight:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 140.0 / 255.0, green: 82.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
                        .init(red: 93.0 / 255.0, green: 225.0 / 255.0, blue: 87.0 / 230.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .arcticWave:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 94.0 / 255.0, green: 224.0 / 255.0, blue: 230.0 / 255.0, alpha: 1.0),
                        .init(red: 0.0 / 255.0, green: 74.0 / 255.0, blue: 173.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .tropicalBloom:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 140.0 / 255.0, green: 82.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
                        .init(red: 3.0 / 255.0, green: 191.0 / 255.0, blue: 98.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .aquaForest:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 0.0 / 255.0, green: 151.0 / 255.0, blue: 178.0 / 255.0, alpha: 1.0),
                        .init(red: 126.0 / 255.0, green: 217.0 / 255.0, blue: 87.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .limeLagoon:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 16.0 / 255.0, green: 192.0 / 255.0, blue: 223.0 / 255.0, alpha: 1.0),
                        .init(red: 255.0 / 255.0, green: 222.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .goldenDusk:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 255.0 / 255.0, green: 222.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0),
                        .init(red: 255.0 / 255.0, green: 145.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .peachFizz:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 10.0 / 255.0, green: 151.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0),
                        .init(red: 123.0 / 255.0, green: 217.0 / 255.0, blue: 87.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .sunsetPop:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 140.0 / 255.0, green: 82.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
                        .init(red: 255.0 / 255.0, green: 145.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
                
            case .sunset:
                return HGradient(
                    startPoint: .zero,
                    endPoint: CGPoint(x: 1, y: 1),
                    colors: [UIColor.red, UIColor.orange, UIColor.systemPink, UIColor.purple]
                )
            case .oceanBreeze:
                return HGradient(
                    startPoint: .zero,
                    endPoint: CGPoint(x: 1, y: 1),
                    colors: [UIColor.blue, UIColor.cyan, UIColor.green]
                )
            case .peachy:
                return HGradient(
                    startPoint: .zero,
                    endPoint: CGPoint(x: 1, y: 0),
                    colors: [peach, UIColor.systemPink, UIColor.white]
                )
            case .lavenderMist:
                return HGradient(
                    startPoint: .zero,
                    endPoint: CGPoint(x: 1, y: 1),
                    colors: [UIColor.purple, lavender, UIColor.white]
                )
            case .nightSky:
                return HGradient(
                    startPoint: .zero,
                    endPoint: CGPoint(x: 1, y: 1),
                    colors: [UIColor.black, UIColor.darkGray, UIColor.blue]
                )
            case .pinkDream:
                return HGradient(
                    startPoint: .zero,
                    endPoint: CGPoint(x: 1, y: 1),
                    colors: [UIColor.systemPink, fuchsia, UIColor.white]
                )
            case .autumnLeaves:
                return HGradient(
                    startPoint: .zero,
                    endPoint: CGPoint(x: 1, y: 1),
                    colors: [UIColor.orange, UIColor.red, UIColor.yellow]
                )
            case .mintyFresh:
                return HGradient(
                    startPoint: .zero,
                    endPoint: CGPoint(x: 1, y: 1),
                    colors: [UIColor.green, mint, UIColor.white]
                )
            case .galaxy:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [UIColor.purple, UIColor.blue, UIColor.black],
                    locations: [0, 1]
                )
                
            case .darkForest:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 2.0 / 255.0, green: 48.0 / 255.0, blue: 31.0 / 255.0, alpha: 1.0),
                        .init(red: 78.0 / 255.0, green: 109.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .freshSpring:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 2.0 / 255.0, green: 48.0 / 255.0, blue: 31.0 / 255.0, alpha: 1.0),
                        .init(red: 167.0 / 255.0, green: 199.0 / 255.0, blue: 165.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .deepForest:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 2.0 / 255.0, green: 48.0 / 255.0, blue: 31.0 / 255.0, alpha: 1.0),
                        .init(red: 0.0 / 255.0, green: 59.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .gardenGlow:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 2.0 / 255.0, green: 48.0 / 255.0, blue: 31.0 / 255.0, alpha: 1.0),
                        .init(red: 176.0 / 255.0, green: 208.0 / 255.0, blue: 165.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
            case .dayAndNight:
                return HGradient(
                    startPoint: CGPoint(x: 0, y: 0.5),
                    endPoint: CGPoint(x: 1, y: 0.5),
                    colors: [
                        .init(red: 2.0 / 255.0, green: 48.0 / 255.0, blue: 31.0 / 255.0, alpha: 1.0),
                        .init(red: 80.0 / 255.0, green: 166.0 / 255.0, blue: 133.0 / 255.0, alpha: 1.0)
                    ],
                    locations: [0, 1]
                )
             
            case .naturalRenewal:
                        return HGradient(
                            startPoint: CGPoint(x: 0, y: 0.5),
                            endPoint: CGPoint(x: 1, y: 0.5),
                            colors: [
                                .init(red: 168.0 / 255.0, green: 230.0 / 255.0, blue: 163.0 / 255.0, alpha: 1.0),
                                .init(red: 108.0 / 255.0, green: 191.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0)
                            ],
                            locations: [0, 1]
                        )
                    case .forestFresh:
                        return HGradient(
                            startPoint: CGPoint(x: 0, y: 0.5),
                            endPoint: CGPoint(x: 1, y: 0.5),
                            colors: [
                                .init(red: 117.0 / 255.0, green: 169.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0),
                                .init(red: 77.0 / 255.0, green: 139.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0)
                            ],
                            locations: [0, 1]
                        )
                    case .softGrass:
                        return HGradient(
                            startPoint: CGPoint(x: 0, y: 0.5),
                            endPoint: CGPoint(x: 1, y: 0.5),
                            colors: [
                                .init(red: 196.0 / 255.0, green: 230.0 / 255.0, blue: 163.0 / 255.0, alpha: 1.0),
                                .init(red: 127.0 / 255.0, green: 191.0 / 255.0, blue: 108.0 / 255.0, alpha: 1.0)
                            ],
                            locations: [0, 1]
                        )
                    case .underTheShade:
                        return HGradient(
                            startPoint: CGPoint(x: 0, y: 0.5),
                            endPoint: CGPoint(x: 1, y: 0.5),
                            colors: [
                                .init(red: 46.0 / 255.0, green: 80.0 / 255.0, blue: 53.0 / 255.0, alpha: 1.0),
                                .init(red: 167.0 / 255.0, green: 199.0 / 255.0, blue: 165.0 / 255.0, alpha: 1.0)
                            ],
                            locations: [0, 1]
                        )
                    case .freshSpringBreeze:
                        return HGradient(
                            startPoint: CGPoint(x: 0, y: 0.5),
                            endPoint: CGPoint(x: 1, y: 0.5),
                            colors: [
                                .init(red: 141.0 / 255.0, green: 225.0 / 255.0, blue: 164.0 / 255.0, alpha: 1.0),
                                .init(red: 167.0 / 255.0, green: 199.0 / 255.0, blue: 165.0 / 255.0, alpha: 1.0)
                            ],
                            locations: [0, 1]
                        )
                    case .endlessSpring:
                        return HGradient(
                            startPoint: CGPoint(x: 0, y: 0.5),
                            endPoint: CGPoint(x: 1, y: 0.5),
                            colors: [
                                .init(red: 185.0 / 255.0, green: 225.0 / 255.0, blue: 198.0 / 255.0, alpha: 1.0),
                                .init(red: 111.0 / 255.0, green: 158.0 / 255.0, blue: 87.0 / 255.0, alpha: 1.0)
                            ],
                            locations: [0, 1]
                        )
                    case .risingLeaves:
                        return HGradient(
                            startPoint: CGPoint(x: 0, y: 0.5),
                            endPoint: CGPoint(x: 1, y: 0.5),
                            colors: [
                                .init(red: 176.0 / 255.0, green: 228.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0),
                                .init(red: 133.0 / 255.0, green: 208.0 / 255.0, blue: 110.0 / 255.0, alpha: 1.0)
                            ],
                            locations: [0, 1]
                        )
                    case .mysticForest:
                        return HGradient(
                            startPoint: CGPoint(x: 0, y: 0.5),
                            endPoint: CGPoint(x: 1, y: 0.5),
                            colors: [
                                .init(red: 47.0 / 255.0, green: 79.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0),
                                .init(red: 90.0 / 255.0, green: 155.0 / 255.0, blue: 110.0 / 255.0, alpha: 1.0)
                            ],
                            locations: [0, 1]
                        )
            }
        }
    }
}


public extension HGradient {
    enum AnimationType: String, Codable {
        case opacityChange
        case wave
        case breathing
        case shimmer
        
        public var animation: CABasicAnimation {
            switch self {
            case .opacityChange:
                let animation = CABasicAnimation(keyPath: "opacity")
                animation.fromValue = 1.0
                animation.toValue = 0.75
                animation.duration = 4
                animation.autoreverses = true
                animation.repeatCount = .infinity
                return animation
            case .wave:
                let animation = CABasicAnimation(keyPath: "startPoint")
                animation.fromValue = CGPoint(x: 0.3, y: 0.3)
                animation.toValue = CGPoint(x: 0.8, y: 0.3)
                animation.duration = 4.0
                animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
                animation.autoreverses = true
                animation.repeatCount = .infinity
                return animation
            case .breathing:
                let animation = CABasicAnimation(keyPath: "locations")
                animation.fromValue = [0.0, 0.5, 1.0]
                animation.toValue = [0.2, 0.8, 1.2]
                animation.duration = 3.0
                animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
                animation.autoreverses = true
                animation.repeatCount = .infinity
                return animation
            case .shimmer:
                let animation = CABasicAnimation(keyPath: "locations")
                animation.fromValue = [0.1, 0.4, 0.6]
                animation.toValue = [0.3, 0.9, 1.0]
                animation.duration = 2.0
                animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
                animation.repeatCount = .infinity
                animation.autoreverses = true
                return animation
                
                
            }
        }
    }
    
    enum GradientLayerType: String, Codable {
        case axial
        case conic
        case radial
        
        public func type() -> CAGradientLayerType {
            switch self {
            case .axial:   .axial
            case .conic:   .conic
            case .radial:  .radial
            }
        }
        
        public func startPoint() -> CGPoint {
            switch self {
            case .axial:
                return .init(x: 0, y: 0.5)
            case .radial:
                return .init(x: 0, y: 0)
            case .conic:
                return .init(x: 0.5, y: 0.5)
            }
        }
        
        public func endPoint() -> CGPoint {
            switch self {
            case .axial:
                return .init(x: 1, y: 0.5)
            case .radial:
                return .init(x: 1, y: 1)
            case .conic:
                return .init(x: 1, y: 1)
            }
        }
    }
}
