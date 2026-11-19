<p align="center">
  <img src="https://i.ibb.co/zh0Lrz6J/test.png" alt="Enliq" width="320"/>
</p>

<h1 align="center">EIQUserInterface iOS SDK</h1>

<p align="center">
  <a href="https://github.com/loodos/enliq-ui-ios-sdk/releases/latest"><img src="https://img.shields.io/github/v/release/loodos/enliq-ui-ios-sdk?label=release&sort=semver" alt="Latest release"/></a>
  <img src="https://img.shields.io/badge/platform-iOS%2015.0%2B-blue.svg" alt="Platform iOS 15.0+"/>
  <a href="https://swift.org/package-manager"><img src="https://img.shields.io/badge/SPM-compatible-brightgreen.svg" alt="Swift Package Manager compatible"/></a>
  <img src="https://img.shields.io/badge/distribution-XCFramework-lightgrey.svg" alt="Binary XCFramework"/>
</p>

<p align="center">
  Ready-to-use UIKit components — in-app browser, barcode reader, image slider, pan modal,<br/>
  pop menu, marquee label, loadable button and view controller transitions — by <a href="https://www.enliq.com">Enliq</a>.
</p>

<p align="center">
  <a href="https://developer.enliq.com"><b>Developer Docs</b></a> ·
  <a href="https://github.com/loodos/enliq-ui-ios-sdk/releases"><b>Releases</b></a> ·
  <a href="#support"><b>Support</b></a>
</p>

---

## Contents

- [Requirements](#requirements)
- [Libraries](#libraries)
- [Installation](#installation)
- [EIQImageSlider](#eiqimageslider)
- [EIQTransition](#eiqtransition)
- [Migrating to 1.2](#migrating-to-12)
- [Support](#support)

## Requirements

| | Minimum |
|---|---|
| iOS | 15.0 |
| Xcode | 16.0 |
| Swift | 5.9 |

Every component is distributed as a precompiled **binary XCFramework** built with library evolution. There are **no third-party dependencies**.

## Libraries

Add only the components you need, or `EIQUserInterface` to get all of them with a single `import`.

| Library | Description | Docs |
|---|---|---|
| `EIQUserInterface` | All components below; `import EIQUserInterface` re-exports them | — |
| `EIQWebBrowser` | In-app web browser for URLs and HTML with a configurable navigation bar | [Guide](docs/EIQWebBrowser.md) |
| `EIQBarcodeReader` | Camera barcode / QR scanner with torch control and customizable UI | [Guide](docs/EIQBarcodeReader.md) |
| `EIQImageSlider` | Paging image carousel with infinite / auto scroll and center zoom | [Below](#eiqimageslider) |
| `EIQPanModal` | Drag-to-dismiss bottom sheet for any view controller | [Guide](docs/EIQPanModal.md) |
| `EIQPopMenu` | Popover menu anchored to any view | [Guide](docs/EIQPopMenu.md) |
| `EIQSlideText` | Auto-scrolling (marquee) `UILabel` with edge fades | [Guide](docs/EIQSlideText.md) |
| `EIQLoadableButton` | `UIButton` with a built-in loading state | [Guide](docs/EIQLoadableButton.md) |
| `EIQTransition` | Fade / slide / push and shared-element view controller transitions | [Below](#eiqtransition) |

> `import EIQUserInterface` re-exports WebBrowser, LoadableButton, ImageSlider, BarcodeReader, PopMenu and PanModal.
> Import `EIQSlideText` and `EIQTransition` explicitly.

## Installation

### Swift Package Manager

**Xcode:** `File` → `Add Package Dependencies…` → enter the URL below → choose **Up to Next Major Version** → pick the libraries for your target.

```
https://github.com/loodos/enliq-ui-ios-sdk
```

**Package.swift:**

```swift
dependencies: [
    .package(url: "https://github.com/loodos/enliq-ui-ios-sdk.git", .upToNextMajor(from: "1.2.0"))
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "EIQUserInterface", package: "enliq-ui-ios-sdk"),
            // or individual components:
            // .product(name: "EIQWebBrowser", package: "enliq-ui-ios-sdk"),
        ]
    )
]
```

## EIQImageSlider

```swift
import EIQImageSlider

let slider = EIQImageSlider()
slider.images = [UIImage(named: "banner1")!, UIImage(named: "banner2")!]
slider.isInfiniteScrollEnabled = true
slider.isAutoScrollEnabled = true
slider.autoScrollInterval = 4
slider.itemCornerRadius = 12
slider.delegate = self

extension HomeViewController: EIQImageSliderDelegate {
    func imageSlider(_ slider: EIQImageSlider, didSelectItemAt index: IndexPath) {
        // open the tapped banner
    }
}
```

Use `centralZoom = .enabled(…)` to scale down side items, and `scrollToImage(…)` to move programmatically.

## EIQTransition

Configure the transition on the view controller being presented or pushed:

```swift
import EIQTransition

let detail = ProductDetailViewController()
detail.eiq.transitionType = .push(direction: .right)   // .auto, .fade, .slide(direction:), .push(direction:)
detail.eiq.duration = 0.4
navigationController?.pushViewController(detail, animated: true)
```

For shared-element transitions, give the matching views in both screens the same `eiq.id`.

## Migrating to 1.2

- Minimum deployment target is now **iOS 15.0**.
- Install from this repository (`enliq-ui-ios-sdk`); the package name in `.product(…, package:)` is `enliq-ui-ios-sdk`.
- If you previously used the components from source, run **Product → Clean Build Folder** (or delete DerivedData) once after switching.

## Support

- **Integration guides & changelog:** [developer.enliq.com](https://developer.enliq.com)
- **Bug reports:** [GitHub Issues](https://github.com/loodos/enliq-ui-ios-sdk/issues)
- **Account questions:** contact your Enliq account manager.

---

<p align="center">© Enliq. All rights reserved.</p>
