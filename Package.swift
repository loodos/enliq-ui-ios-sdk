// swift-tools-version: 5.9
//
// EIQUserInterface iOS SDK — v1.2.0
// Bu dosya otomatik üretilir; elle düzenlemeyin.

import PackageDescription

let package = Package(
    name: "EIQUserInterface",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        /// Tüm modülleri içeren paket
        .library(name: "EIQUserInterface", targets: ["EIQWebBrowser", "EIQLoadableButton", "EIQImageSlider", "EIQBarcodeReader", "EIQPopMenu", "EIQPanModal", "EIQSlideText", "EIQTransition", "EIQUserInterface"]),
        /// Tekil modüller
        .library(name: "EIQWebBrowser", targets: ["EIQWebBrowser"]),
        .library(name: "EIQLoadableButton", targets: ["EIQLoadableButton"]),
        .library(name: "EIQImageSlider", targets: ["EIQImageSlider"]),
        .library(name: "EIQBarcodeReader", targets: ["EIQBarcodeReader"]),
        .library(name: "EIQPopMenu", targets: ["EIQPopMenu"]),
        .library(name: "EIQPanModal", targets: ["EIQPanModal"]),
        .library(name: "EIQSlideText", targets: ["EIQSlideText"]),
        .library(name: "EIQTransition", targets: ["EIQTransition"]),
    ],
    targets: [
        .binaryTarget(
            name: "EIQWebBrowser",
            url: "https://github.com/loodos/enliq-ui-ios-sdk/releases/download/v1.2.0/EIQWebBrowser.xcframework.zip",
            checksum: "dfa21ec628f07adc1682d29790444b2f4b7aea2776681a216b2719f6762f188f"
        ),
        .binaryTarget(
            name: "EIQLoadableButton",
            url: "https://github.com/loodos/enliq-ui-ios-sdk/releases/download/v1.2.0/EIQLoadableButton.xcframework.zip",
            checksum: "3291d3a99f7fbb9895999f378cb5f89f9d16f3af2e70648db768fd7d1618b8b2"
        ),
        .binaryTarget(
            name: "EIQImageSlider",
            url: "https://github.com/loodos/enliq-ui-ios-sdk/releases/download/v1.2.0/EIQImageSlider.xcframework.zip",
            checksum: "143ee2e54258d00a4c0e1561b49ff059a7d6c8aea290b6dab30c77f889aee5b5"
        ),
        .binaryTarget(
            name: "EIQBarcodeReader",
            url: "https://github.com/loodos/enliq-ui-ios-sdk/releases/download/v1.2.0/EIQBarcodeReader.xcframework.zip",
            checksum: "3e48634e67de0f9cc299ca746e8d50262dfeb4a0a091b3f2ed7361c77182681e"
        ),
        .binaryTarget(
            name: "EIQPopMenu",
            url: "https://github.com/loodos/enliq-ui-ios-sdk/releases/download/v1.2.0/EIQPopMenu.xcframework.zip",
            checksum: "a38b4826f69f15d2cb0b1d64161c9a236ea7a22061f2f82af0a642ab1b7100bd"
        ),
        .binaryTarget(
            name: "EIQPanModal",
            url: "https://github.com/loodos/enliq-ui-ios-sdk/releases/download/v1.2.0/EIQPanModal.xcframework.zip",
            checksum: "63dd3a113e97701973624b0249ab3b02838e3cf578b5fa4e4e7c55bb5b21a927"
        ),
        .binaryTarget(
            name: "EIQSlideText",
            url: "https://github.com/loodos/enliq-ui-ios-sdk/releases/download/v1.2.0/EIQSlideText.xcframework.zip",
            checksum: "a129878fe0e50e9f5a0e1ea06b3de530315fd5789c1e3b9c42f6a6252a6e2e80"
        ),
        .binaryTarget(
            name: "EIQTransition",
            url: "https://github.com/loodos/enliq-ui-ios-sdk/releases/download/v1.2.0/EIQTransition.xcframework.zip",
            checksum: "861c909c1378a9e25d3c05352928f6ab764af842e06b2f150bf3ab197cd9b3fc"
        ),
        .binaryTarget(
            name: "EIQUserInterface",
            url: "https://github.com/loodos/enliq-ui-ios-sdk/releases/download/v1.2.0/EIQUserInterface.xcframework.zip",
            checksum: "f970ca7366078e66645dd705cb0e006becea94054d1987dc2a23d11801f380f9"
        ),
    ]
)
