// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Aegis-Format",
    products: [

        .library(
            name: "Aegis-Format",
            targets: ["Aegis-Format"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "Aegis-Format",
            dependencies: []),
        .testTarget(
            name: "Aegis-FormatTests",
            dependencies: ["Aegis-Format"]),
    ]
)
