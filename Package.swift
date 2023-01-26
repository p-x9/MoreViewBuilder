// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoreViewBuilder",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "MoreViewBuilder",
            targets: ["MoreViewBuilder"]
        ),
        .executable(
            name: "prepare-more-viewbuilder",
            targets: ["prepare-more-viewbuilder"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MoreViewBuilder",
            dependencies: [],
            plugins: [
                .plugin(name: "PrepareMoreViewBuilder")
            ]
        ),
        .plugin(
            name: "PrepareMoreViewBuilder",
            capability: .buildTool(),
            dependencies: [
                "prepare-more-viewbuilder-bin"
            ]
        ),
        .executableTarget(
            name: "prepare-more-viewbuilder"
        ),
//        DUBUG
        .binaryTarget(name: "prepare-more-viewbuilder-bin", path: "./prepare-more-viewbuilder-bin.artifactbundle.zip"),
        .testTarget(
            name: "MoreViewBuilderTests",
            dependencies: ["MoreViewBuilder"]),
    ]
)
