// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DelegateNotificationCenter",
    platforms: [
        .macOS(.v10_13), .iOS(.v11), .watchOS(.v4), .tvOS(.v11)
    ],
    products: [
        .library(name: "DelegateNotificationCenter", targets: ["DelegateNotificationCenter"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(name: "DelegateNotificationCenter"),
        .testTarget(name: "DelegateNotificationCenterTests", dependencies: ["DelegateNotificationCenter"])
    ]
)
