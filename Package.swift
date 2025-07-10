// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "EIQUserInterface",
    platforms: [.iOS(.v13)],
    products: [
        /// **Unified package**: It contains all sub-packages
        .library(
            name: "EIQUserInterface",
            targets: ["EIQUserInterface"]
        ),
        /// **Single packages**
        .library(
            name: "EIQWebBrowser",
            targets: ["EIQWebBrowser"]
        )
    ],
    targets: [
        /// `EIQUserInterface` target
        .target(
            name: "EIQUserInterface",
            dependencies: [
                "EIQWebBrowser"
            ],
            path: "Sources"
        ),
        /// `EIQWebBrowser` target
        .binaryTarget(
            name: "EIQWebBrowser",
            url: "https://github.com/loodos/enliq-ui-ios-sdk/releases/download/0.0.1/eiquserinterface.xcframework.zip",
            checksum: "d4a7f868cffd2f9db2927e7b9f6bd394cc53811adb90af7a17e9ca4d4fafc9c3"
        )
    ]
)
