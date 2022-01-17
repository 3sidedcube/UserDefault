// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserDefault",
    platforms: [
        .macOS(.v11),
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "UserDefault",
            targets: ["UserDefault"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "UserDefault",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "UserDefaultTests",
            dependencies: ["UserDefault"]
        ),
    ]
)
