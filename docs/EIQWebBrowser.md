# EIQWebBrowser

`EIQWebBrowser` is a customizable Swift package designed to provide an embeddable web browser component with a flexible navigation bar for iOS applications. It allows for easy configuration of the web content and the appearance of the navigation bar, giving developers control over how users interact with web content within their apps.

## Features

- Embeddable web browser view with support for both URL and HTML content.
- Customizable navigation bar with options for hiding, showing a back button, or showing a close button.
- Easy-to-use configuration for setting colors, fonts, and button images.
- Callback mechanism for handling user actions, such as tapping the back or close buttons.

## Requirements

- iOS 15.0+
- Swift 5.9+
- Xcode 16.0+

## Installation

To use `EIQWebBrowser`, add the following dependency in your `Package.swift` file:

```swift
    dependencies: [
        ...
        .package(
            url: "https://github.com/loodos/enliq-ui-ios-sdk.git",
            .upToNextMajor(from: "1.2.0")
        )
    ],
    ....
    targets: [
        ...,
        .target(
            name: "{Target Name}",
            dependencies: [
                ...,
                .product(name: "EIQWebBrowser", package: "enliq-ui-ios-sdk")
            ]
        ),
        ...
    ]
```

## Usage
Here is an example of how to configure and display the EIQWebBrowser component in your view controller:

```swift
import UIKit
import EIQWebBrowser

class WebViewController: UIViewController {
    
    private var topBarView: EIQWebBrowserTopBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the web browser content
        let webContent = EIQWebBrowserContent(
            backgroundColor: .white,
            navigationBarType: .back(content: EIQNavigationBarTypeContent(
                titleText: "Loodos",
                titleFont: UIFont.systemFont(ofSize: 17, weight: .bold),
                titleColor: .black,
                buttonImage: UIImage(systemName: "arrow.left"),
                backgroundColor: .white
            )),
            contentType: .url(string: "https://www.loodos.com")
        )

        let inAppController = EIQWebViewController(content: content)
        
        // Transaction Stage
        navigationController?.pushViewController(inAppController, animated: true)
        // Or
        present(inAppController, animated: true)
    }
}
```

## Customization

### Navigation Bar Types

The `EIQWebBrowserNavigationBarType` enum allows you to customize the appearance of the navigation bar. There are three options:

* .hidden: No navigation bar.
* .back: Shows a back button with customizable title and icon.
* .close: Shows a close button with customizable title and icon.

```swift
    public enum EIQWebBrowserNavigationBarType {
        case hidden
        case back(content: EIQNavigationBarTypeContent)
        case close(content: EIQNavigationBarTypeContent)
    }
```

### Content Types

The web content can be provided in two formats using the EIQWebBrowserContentType enum:

* .url(string: String): Load a webpage via URL.
* .html(string: String): Load HTML content as a string.

```swift
    public enum EIQWebBrowserContentType: Codable {
        case url(string: String)
        case html(string: String)
    }
```
