# EIQLoadableButton

`EIQLoadableButton` is a lightweight and customizable Swift package that extends `UIButton` to provide a built-in loading state with an activity indicator. It simplifies handling async actions by disabling interaction and showing a spinner automatically when tapped.

## Features

- 🔄 Built-in **loading indicator** (spinner) centered inside the button.  
- 🚫 Disables user interaction while loading.  
- 🎨 Customizable **indicator color**.  
- ⚡ Automatically triggers loading state on tap.  
- ✅ `onTap` closure for handling button actions without using `addTarget`.  
- 🧩 Clean Combine-based implementation.

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
            .product(name: "EIQLoadableButton", package: "enliq-ui-ios-sdk")
        ]
    ),
    ...
]
```

## Usage

Here’s an example of how to use the `EIQLoadableButton` in your view:

```swift
import UIKit
import EIQLoadableButton

class ViewController: UIViewController {

    private let button: EIQLoadableButton = {
        let btn = EIQLoadableButton(type: .system)
        btn.setTitle("Submit", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.tintColor = .white
        btn.layer.cornerRadius = 8
        btn.indicatorColor = .white
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])

        // Assign action
        button.onTap = { [weak self] in
            self?.simulateNetworkRequest()
        }
    }

    private func simulateNetworkRequest() {
        // Simulate async task
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.button.hideLoading()
        }
    }
}
```

## API Reference

### Properties

| Property | Type | Description |
|-----------|------|-------------|
| `onTap` | `(() -> Void)?` | Closure called when button is tapped. |
| `indicatorColor` | `UIColor` | Color of the spinner indicator. Default is `.white`. |
| `isLoading` | `Bool` | Indicates whether the button is currently loading. |

### Methods

| Method | Description |
|--------|--------------|
| `showLoading()` | Shows the loading indicator and disables the button. |
| `hideLoading()` | Hides the loading indicator and restores the original title. |

### Deprecated

```swift
addTarget(_:action:for:)
```

> ⚠️ Deprecated. Use `onTap` instead for handling button actions.

---

## 🔧 Inheritance

`EIQLoadableButton` is declared as `open`, which means it can be subclassed and extended.  
You can override its methods to provide custom behaviors for your own button styles.

### Example

```swift
import UIKit
import EIQLoadableButton

final class CustomLoadableButton: EIQLoadableButton {
}
```

## Example

Here’s a minimal example:

```swift
let loadableButton = CustomLoadableButton()
loadableButton.setTitle("Login", for: .normal)
loadableButton.indicatorColor = .white
loadableButton.onTap = {
    print("Tapped!")
}
```

---

## License

MIT License © [Loodos Teknoloji A.Ş.](https://www.loodos.com)
