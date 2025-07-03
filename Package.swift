// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenAIKit",
    platforms: [
        .iOS(
            .v16
        ),
        .macOS(
            .v13
        )
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OpenAIKit",
            targets: ["OpenAIKit"]),
    ],
    dependencies: [.package(
        url: "https://github.com/FranAlarza/NetworkKit.git",
        from: "1.0.0"
    )],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OpenAIKit",
            dependencies: [.product(
                name: "NetworkKit",
                package: "NetworkKit"
            )]
        ),
        .testTarget(
            name: "OpenAIKitTests",
            dependencies: ["OpenAIKit"]
        ),
    ]
)
