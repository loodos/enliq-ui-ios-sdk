# EIQPopMenu

`EIQPopMenu` is a lightweight popover menu component that displays a customizable menu anchored to any source view. It is ideal for settings menus, contextual actions, and quick in-app options.

## Features

- 🎯 **Popover-style contextual menu** anchored to any UIView.
- 🎨 **Fully customizable items** (font, color, icon).
- 📏 Automatic **dynamic height** based on content.
- ↕️ Configurable **arrow direction**.
- 🧩 Simple **delegate-based callback** for selected menu items.
- 🧼 Clean UIKit-based implementation — no dependencies.

---

## Models

### 📌 EIQPopMenuItem

```swift
public struct EIQPopMenuItem {
    public let title: String
    public let font: UIFont
    public let textColor: UIColor
    public let icon: UIImage?
    
    public init(
        title: String,
        font: UIFont,
        textColor: UIColor,
        icon: UIImage? = nil
    ) {
        self.title = title
        self.font = font
        self.textColor = textColor
        self.icon = icon
    }
}
```

---

### ⚙️ EIQPopMenuConfig

```swift
public struct EIQPopMenuConfig {
    public var arrowDirection: UIPopoverArrowDirection
    public var preferredContentWidth: CGFloat

    public init(
        arrowDirection: UIPopoverArrowDirection = .up,
        preferredContentWidth: CGFloat = 240
    ) {
        self.arrowDirection = arrowDirection
        self.preferredContentWidth = preferredContentWidth
    }
}
```
---

## Usage
```swift
EIQPopMenuManager.shared.showPopMenu(
    inViewController: self,
    items: viewModel.menuItems,
    sourceView: item,
    delegate: self
)
```

### Delegate

```swift
extension SettingsViewController: EIQPopMenuManagerDelegate {
    public func eiqDidSelectMenu(_ item: EIQPopMenuItem) {
        presentedViewController?.dismiss(animated: false)
    }
}
```
---
