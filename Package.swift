// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.7

// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AsyncRequestKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "AsyncRequestKit",
            targets: ["AsyncRequestKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AsyncRequestKit",
            dependencies: [],
            path: "Sources/AsyncRequestKit"
        ),
        .testTarget(
            name: "AsyncRequestKitTests",
            dependencies: ["AsyncRequestKit"],
            path: "Tests/AsyncRequestKitTests"
        ),
    ]
)
