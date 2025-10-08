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
            checksum: "483ed2715a275a96f6c42810d068ce5ee531e997b8793dbe81245cd0705a7aff"
        )
    ]
)
