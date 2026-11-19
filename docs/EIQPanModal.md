# EIQPanModal

## Features

* Supports any type of `UIViewController`
* Seamless transition between modal and content
* Maintains 60 fps performance

## Requirements

- iOS 15.0+
- Swift 5.9+
- Xcode 16.0+

## Installation

Swift Package Manager:

To use `EIQPanModal`, add the following dependency to your `Package.swift` file:

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
            .product(name: "EIQPanModal", package: "enliq-ui-ios-sdk")
        ]
    ),
    ...
]
```

## Usage

EIQPanModal was designed to be used effortlessly. Simply call `presentPanModal` in the same way you would expect to present a `UIViewController`

```swift
.presentPanModal(yourViewController)
```

The presented view controller must conform to `EIQPanModalPresentable` to take advantage of the customizable options

```swift
extension YourViewController: EIQPanModalPresentable {

    var panScrollable: UIScrollView? {
        return nil
    }
}
```

### PanScrollable

If the presented view controller has an embedded `UIScrollView` e.g. as is the case with `UITableViewController`, panModal will seamlessly transition pan gestures between the modal and the scroll view

```swift
class TableViewController: UITableViewController, EIQPanModalPresentable {

    var panScrollable: UIScrollView? {
        return tableView
    }
}
```

### Adjusting Heights

Height values of the panModal can be adjusted by overriding `shortFormHeight` or `longFormHeight`

```swift
var shortFormHeight: EIQPanModalHeight {
    return .contentHeight(300)
}

var longFormHeight: EIQPanModalHeight {
    return .maxHeightWithTopInset(40)
}
```

### Updates at Runtime

Values are stored during presentation, so when adjusting at runtime you should call `panModalSetNeedsLayoutUpdate()`

```swift
func viewDidLoad() {
    hasLoaded = true

    panModalSetNeedsLayoutUpdate()
    panModalTransition(to: .shortForm)
}

var shortFormHeight: EIQPanModalHeight {
    if hasLoaded {
        return .contentHeight(200)
    }
    return .maxHeight
}
```

### Example Usage 

```swift
import EIQPanModal
import UIKit

// MARK: - Typealias
public typealias PanModalCompletion = () -> Void

// MARK: - BasePanModalViewController
open class BasePanModalViewController: UIViewController, EIQPanModalPresentable {
    // MARK: - Public Data
    public var dismissCompletion: PanModalCompletion?

    // MARK: - Lifecycle
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupViews()
    }

    // MARK: - Setup
    private func setupViews() {}

    // MARK: - Publics
    public var panScrollable: UIScrollView? {
        nil
    }

    public var topOffset: CGFloat {
        0
    }

    public var shortFormHeight: EIQPanModalHeight {
        .intrinsicHeight
    }

    public var longFormHeight: EIQPanModalHeight {
        .intrinsicHeight
    }

    public var allowsTapToDismiss: Bool = false
    public var allowsDragToDismiss: Bool = false

    public var showDragIndicator: Bool {
        false
    }

    public var panModalBackgroundColor: UIColor {
        .black.withAlphaComponent(0.6)
    }

    public var transitionAnimationOptions: UIView.AnimationOptions {
        [.curveEaseInOut, .allowUserInteraction, .beginFromCurrentState]
    }

    public var shouldRoundTopCorners: Bool {
        true
    }

    public var cornerRadius: CGFloat {
        12
    }

    public var springDamping: CGFloat {
        0.8
    }

    public var transitionDuration: Double {
        0.5
    }

    public func panModalWillDismiss() {
        view.endEditing(true)
    }

    public func panModalDidDismiss() {
        dismissCompletion?()
    }
}
```

```swift
public final class PanModalViewController: BasePanModalViewController {

}
```
