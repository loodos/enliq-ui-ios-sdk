<p align="center">
  <img src="https://i.ibb.co/zh0Lrz6J/test.png" width="180"/>
</p>

# EIQBarcodeReader

`EIQBarcodeReader` is a lightweight and customizable Swift package that provides a simple interface for barcode scanning using the device camera. It manages camera permissions, scanning sessions, and torch control automatically while delivering scan results through a clean delegate-based API.

## Features

## Features

- 📸 **Real-time barcode scanning** with automatic detection and decoding.  
- 🧩 Simple **delegate-based API** for handling scan results and errors.  
- 🪄 Presents a **ready-to-use camera interface** with customizable UI.  
- 🔦 Built-in **torch (flashlight) control** via `toggleTorch(on:)`.  
- ⚙️ Automatic **camera permission** and session management.  
- 🎨 Customizable **action buttons and close icon** using `EIQButtonConfigurator`.  
- 🧠 Lightweight implementation powered by **AVFoundation** — no third-party dependencies.

## Requirements

- iOS 15.0+
- Swift 5.9+
- Xcode 16.0+

## Installation

To use `EIQLoadableButton`, add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    ...
    .package(
        url: "https://github.com/loodos/enliq-ui-ios-sdk.git",
        .upToNextMajor(from: "1.2.0")
    )
],
...
targets: [
    ...,
    .target(
        name: "{Target Name}",
        dependencies: [
            ...,
            .product(name: "EIQBarcodeReader", package: "enliq-ui-ios-sdk")
        ]
    ),
    ...
]
```

## Usage

Here’s an example of how to use the `EIQBarcodeReader` in your view:

```swift
import UIKit
import EIQBarcodeReader

class ViewController: UIViewController {

    private let button: EIQLoadableButton = {
        let btn = EIQLoadableButton()
        btn.setTitle("Open Barcode Reader", for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Assign action
        button.onTap = { [weak self] in
            reader.start(from: self, modalPresentationStyle: .fullScreen)
        }
    }
}
```

---

## Delegates

### 📦 EIQBarcodeReaderDelegate

The `EIQBarcodeReaderDelegate` protocol defines the methods used to receive barcode scanning results.

```swift
public protocol EIQBarcodeReaderDelegate: AnyObject {
    /// Called when a barcode has been successfully scanned.
    /// - Parameters:
    ///   - scanKit: The EIQBarcodeReader instance that performed the scan.
    ///   - value: A string containing the decoded barcode value.
    func scanKit(_ scanKit: EIQBarcodeReader, didScanBarcode value: String)
}
```

Use this delegate to handle barcode results:

```swift
extension ViewController: EIQBarcodeReaderDelegate {
    func scanKit(_ scanKit: EIQBarcodeReader, didScanBarcode value: String) {
        print("✅ Scanned barcode: \(value)")
        scanKit.stop()
    }
}
```

---

### ⚠️ EIQScanErrorDelegate

The `EIQScanErrorDelegate` protocol defines methods for receiving error notifications during the scanning process.

```swift
public protocol EIQScanErrorDelegate: AnyObject {
    func scanKit(didEncounterError error: Error)
}
```

Use this delegate to handle errors such as permission issues or camera access failures:

```swift
extension ViewController: EIQScanErrorDelegate {
    func scanKit(didEncounterError error: Error) {
        print("❌ Scanning failed: \(error.localizedDescription)")
    }
}
```

---

## License

MIT License © [Loodos Teknoloji A.Ş.](https://www.loodos.com)
