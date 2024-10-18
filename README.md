
# RFRatingView
<img alt="Static Badge" src="https://img.shields.io/badge/Xcode-UIView-xcode?&logo=xcode&color=CF212E"> <a href='https://github.com/ibrahimTasdemir27/RFRatingView/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/iOS-swift-xcode?logo=swift">
<a href='https://www.linkedin.com/in/ibrahim-halil-taşdemir-ios-developer-111631245/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/-0B66C2?logo=linkedin">
<a href='https://github.com/ibrahimTasdemir27/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/ibrahimtasdmr27-RFRatingView-xcode?logo=GitHub&color=CF212E">

- UIView simple initializer

## Requirements
- iOS 14.0
- Xcode 15.0+
- Swift 5.10+



## Swift Package Manager

To integrate ViewStyleOptions into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift


```
dependencies: [
    .package(url: "https://github.com/ibrahimTasdemir27/ViewStyleOptions", .upToNextMajor(from: "1.0.7"))
]
```



## Usage
```swift
import ViewStyleOptions

    private let view = UIView(configs: .setRadius(8), .setShadow(.defaultShadow),
                           .setBorder(.lightGray), .setBackground(.systemGray5))
    private let button = UIButton(
        configs: .setTint(.systemBlue), .setRadius(12),
        special: .setImage(.add), .setFont(.systemFont(ofSize: 15)),
        .setContentInset(.init(horizontal: 10)),
        .setAction({ [weak self] in
            //On tapped
        })
    )
    private let label = UILabel(
        special: .setText("Hello"), .setTextColor(.black), .setAligment(.center)
    )

```

## Initializer
```swift

public extension UIView {
    convenience init(configs: ViewStyleOptions...) {
        self.init()
        configs.forEach({ $0.apply(to: self) })
    }
}

public extension UIButton {
    convenience init(configs: ViewStyleOptions..., special: ButtonViewStyleOptions...) {
        self.init()
        configs.forEach({ $0.apply(to: self) })
        special.forEach({ $0.apply(to: self) })
    }
}

public extension UILabel {
    convenience init(configs: ViewStyleOptions..., special: LabelViewStyleOptions...) {
        self.init()
        configs.forEach({ $0.apply(to: self) })
        special.forEach({ $0.apply(to: self) })
    }
}
```







