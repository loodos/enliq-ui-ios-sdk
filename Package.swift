// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "EIQUserInterface",
    platforms: [.iOS(.v13)],
    products: [
        /// **Unified package**: It contains all sub-packages
        .library(
            name: "EnliqUserInterface",
            targets: ["EnliqUserInterface"]
        ),
        /// **Single packages**
        .library(
            name: "EnliqWebBrowser",
            targets: ["EnliqWebBrowser"]
        )
    ],
    targets: [
        /// `EIQUserInterface` target
        .target(
            name: "EnliqUserInterface",
            dependencies: [
                "EnliqWebBrowser"
            ],
            path: "Sources"
        ),
        /// `EIQWebBrowser` target
        .binaryTarget(
            name: "EnliqWebBrowser",
            url: "https://github.com/loodos/enliq-ui-ios-sdk/releases/download/1.0.0/eiqwebbrowser.xcframework.zip",
            checksum: "bd6c2dfea33d0dba2d30b79333fea222e92c644e15d5ed5dd3d7b0f5e60161b5"
        )
    ]
)
