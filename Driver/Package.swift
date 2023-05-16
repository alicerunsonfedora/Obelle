// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Driver",
    platforms: [.macOS(.v13), .iOS(.v16)],
    products: [
        .library(name: "Driver", type: .dynamic, targets: ["Driver"]),
    ],
    dependencies: [
        .package(url: "https://github.com/alicerunsonfedora/SwiftGodot", branch: "main")
    ],
    targets: [
        .target(
            name: "Driver",
            dependencies: ["SwiftGodot"],
            swiftSettings: [.unsafeFlags(["-suppress-warnings"])],
            linkerSettings: [
                .unsafeFlags(["-Xlinker", "-undefined","-Xlinker", "dynamic_lookup"])
            ]
        )
    ]
)
