// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ViewStyleOptions",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "ViewStyleOptions",
            targets: ["ViewStyleOptions"]
        ),
    ],
    dependencies: [
        // SnapKit bağımlılığı
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.1")
    ],
    targets: [
        .target(
            name: "ViewStyleOptions",
            dependencies: [
                "SnapKit"
            ]
        ),
        .testTarget(
            name: "ViewStyleOptionsTests",
            dependencies: ["ViewStyleOptions"]
        ),
    ]
)
