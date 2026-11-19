# EIQSlideText

[![Platform](https://img.shields.io/badge/platform-iOS%2015%2B-lightgrey.svg)](https://github.com/loodos/enliq-ui-ios-sdk)
[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager)

**EIQSlideText** is a powerful and highly customizable UILabel subclass that provides smooth, automatic text scrolling animations. Part of the **EIQUserInterface** package collection.

Perfect for displaying long text in limited space with elegant fade effects and multiple scroll behaviors.

---

## ✨ Features

- 🎯 **6 Scroll Types**: Left, Right, LeftRight, RightLeft, Continuous, ContinuousReverse
- 🎨 **Edge Fade Effects**: Smooth gradient transitions at label edges
- ⚡ **Performance Optimized**: Uses CAReplicatorLayer for efficient rendering
- 🎛️ **Highly Customizable**: Speed, delay, buffers, animation curves
- 📱 **iOS 15+**: Modern Swift implementation
- 🔄 **Automatic Management**: Built-in manager for view controller lifecycle
- 🎭 **IBDesignable**: Visual editing in Interface Builder
- ♿ **Accessibility**: Full VoiceOver support
- 🏗️ **Modular Architecture**: Clean, maintainable code structure

---

## 📦 Installation

### Swift Package Manager

Add **EIQSlideText** as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/loodos/enliq-ui-ios-sdk.git", from: "1.2.0")
]
```

Then add it to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "EIQSlideText", package: "EIQUserInterface")
    ]
)
```

### Xcode Project

1. File → Add Package Dependencies
2. Enter: `https://github.com/loodos/enliq-ui-ios-sdk.git`
3. Select **EIQSlideText** from the product list

### Use Full Package

To get all EIQ components at once:

```swift
.product(name: "EIQUserInterface", package: "EIQUserInterface")
```

This includes: EIQWebBrowser, EIQLoadableButton, EIQImageSlider, EIQBarcodeReader, EIQPopMenu, **EIQSlideText**

---

## 🚀 Quick Start

### Basic Usage

```swift
import EIQSlideText

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = EIQSlideText(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        label.text = "This is a very long text that will scroll automatically!"
        label.type = .continuous
        label.speed = .duration(7.0)
        label.fadeLength = 10.0
        view.addSubview(label)
    }
}
```

### Scroll Types

```swift
// Scroll left once and stop
label.type = .left

// Scroll left then right (ping-pong)
label.type = .leftRight

// Continuous loop
label.type = .continuous

// Reverse continuous loop
label.type = .continuousReverse

// Scroll right once and stop
label.type = .right

// Scroll right then left (ping-pong)
label.type = .rightLeft
```

### Speed Configuration

```swift
// By duration (seconds per complete cycle)
label.speed = .duration(5.0)

// By rate (points per second)
label.speed = .rate(30.0)
```

### Edge Fade Effects

```swift
// Add gradient fade at edges (in points)
label.fadeLength = 15.0

// No fade
label.fadeLength = 0.0
```

---

## 🎨 Customization

### Animation Timing

```swift
label.animationDelay = 2.0        // Delay before starting (seconds)
label.animationCurve = .easeInOut // Animation curve
```

### Buffers

```swift
label.leadingBuffer = 10.0   // Space before text starts
label.trailingBuffer = 10.0  // Space after text ends
```

### Behavior Control

```swift
// Prevent automatic scrolling
label.holdScrolling = true

// Require tap to start scrolling
label.tapToScroll = true

// Force scrolling even if text fits
label.forceScrolling = true

// Make it behave like normal UILabel
label.labelize = true
```

---

## 🎯 Advanced Usage

### Manual Control

```swift
// Start/restart scrolling
label.restartLabel()

// Trigger single scroll
label.triggerScrollStart()

// Pause animation
label.pauseLabel()

// Resume animation
label.unpauseLabel()

// Stop and reset
label.shutdownLabel()
```

### Check Animation State

```swift
// Is animation paused?
if label.isPaused {
    print("Animation is paused")
}

// Is label away from home position?
if label.awayFromHome {
    print("Currently scrolling")
}

// Get animation progress (0.0 - 1.0)
if let progress = label.animationPosition {
    print("Progress: \(progress * 100)%")
}
```

### Convert Touch to Text Coordinate

```swift
// Convert frame point to text coordinate
let touchPoint = gesture.location(in: label)
if let textPoint = label.textCoordinateForFramePoint(touchPoint) {
    print("Touched text at: \(textPoint)")
}
```

---

## 🔄 Manager Class

Use **EIQSlideTextManager** to control all labels in a view controller:

```swift
import EIQSlideText

class MyViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Restart all labels
        EIQSlideTextManager.restartLabelsOfController(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Stop all labels
        EIQSlideTextManager.controllerLabelsLabelize(self)
    }
}
```

### Manager Methods

```swift
// Restart all labels in view controller
EIQSlideTextManager.restartLabelsOfController(viewController)

// Make all labels static (stop scrolling)
EIQSlideTextManager.controllerLabelsLabelize(viewController)

// Make all labels animate again
EIQSlideTextManager.controllerLabelsAnimate(viewController)

// Convenience methods
EIQSlideTextManager.controllerViewWillAppear(viewController)
EIQSlideTextManager.controllerViewDidAppear(viewController)
```

---

## 🎭 Interface Builder

EIQSlideText is **@IBDesignable** and supports Interface Builder:

1. Add a UILabel to your storyboard
2. Set Custom Class to `EIQSlideText`
3. Configure properties in Attributes Inspector:
   - Labelize
   - Hold Scrolling
   - Force Scrolling
   - Tap To Scroll
   - Leading Buffer
   - Trailing Buffer
   - Fade Length
   - Animation Delay

---

## 📐 Custom Scroll Sequences

Create advanced scroll patterns with custom sequences:

```swift
let customSequence: [EIQMarqueeStep] = [
    EIQScrollStep(timeStep: 0.0, position: .home, edgeFades: .trailing),
    EIQScrollStep(timeStep: 2.0, position: .home, edgeFades: .trailing),
    EIQFadeStep(timeStep: 0.5, edgeFades: [.leading, .trailing]),
    EIQScrollStep(timeStep: 5.0, timingFunction: .easeInOut, position: .away, edgeFades: .leading),
    EIQScrollStep(timeStep: 1.0, position: .away, edgeFades: .leading)
]

label.scrollSequence = customSequence
```

---

## 📱 Examples

### News Ticker

```swift
let ticker = EIQSlideText(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
ticker.text = "🔴 BREAKING NEWS: Important update here..."
ticker.type = .continuous
ticker.speed = .rate(50)
ticker.fadeLength = 20
ticker.backgroundColor = .red
ticker.textColor = .white
```

### Song Title in Music Player

```swift
let songLabel = EIQSlideText(frame: CGRect(x: 20, y: 100, width: 280, height: 25))
songLabel.text = "The Beatles - Hey Jude (Remastered 2009)"
songLabel.type = .leftRight
songLabel.speed = .duration(8.0)
songLabel.animationDelay = 2.0
songLabel.fadeLength = 15
```

### Notification Banner

```swift
let banner = EIQSlideText(frame: CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: 35))
banner.text = "📢 New message from John: Hey, are you available for a meeting?"
banner.type = .left
banner.speed = .duration(10.0)
banner.fadeLength = 25
banner.tapToScroll = true
```

---

## 🔧 Requirements

- iOS 15.0+
- Swift 5.9+
- Xcode 14.0+

---


---

## 💬 Support

- 🐛 Issues: [GitHub Issues](https://github.com/loodos/enliq-ui-ios-sdk.git/issues)
- 📖 Documentation: [Full Docs](https://github.com/loodos/enliq-ui-ios-sdk.git/EIQUserInterface/Sources/EIQSlideText/README.md)

---

**Made with ❤️ by EIQ Team**
