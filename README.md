# EIQUserInterface

`EIQUserInterface` is a Swift package that includes multiple user interface components packages for iOS development. By integrating this package into your project, you can choose to add one or both of the included sub-packages.


## Included Packages

### 1. EIQWebBrowser

`EIQWebBrowser` is an in-app-web browser. It has a controller and dedicated configuration models for the content.

## Installation: 

If you are working on a single module project you can use Option 1.
Otherwise, (if you are developed a SPM based modular project) you should use Option 2.

### Option 1: Single Module Project

- File > Swift Packages > Add Package Dependency or you can use Xcode SPM addition menu:
<img width="1024" alt="packageAdding" src="https://github.com/user-attachments/assets/32235ea4-e9f3-45c1-8c31-8debd29fa410">

- Add `https://github.com/loodos/enliq-ios-ui.git`

- Select "Up to Next Minor" with "1.0.0"

<img width="1024" alt="repositoryAddition" src="https://github.com/user-attachments/assets/8073bb7a-9ee7-4d76-b9f8-17482e6a0859">


**Note:** Since this module is in a pre-release stage, the release tag was created as 1.0.0. Some minor changes can be applied. After the release stage, this selection opiton can be changed as "Up to Next Major".

### Option 2: SPM Modular Project

#### Sub-Option 1: Adding All Packages

You can add all packages with using the `EIQUserInterface` target on at once.
To use `EIQUserInterface`, add the following dependency in your `Package.swift` file:

```swift
    dependencies: [
        ...
        .package(
            url: "https://github.com/loodos/enliq-ios-ui.git",
            .upToNextMinor(from: "1.0.0")
        )
    ],
    ....
    targets: [
        ...,
        .target(
            name: "{Target Name}",
            dependencies: [
                ...,
                .product(name: "EIQUserInterface", package: "enliq-ios-ui"),
            ]
        ),
        ...
    ]
```
Then, depending on which sub-package you want to use, add the relevant package(s) to your target’s dependencies.

#### Sub-Option 2: Adding Single Package

To include **only** (for example) `EIQWebBrowser`, configure your target like this:

```swift
    dependencies: [
        ...
        .package(
            url: "https://github.com/loodos/enliq-ios-ui.git",
            .upToNextMinor(from: "1.0.0")
        )
    ],
    ....
    targets: [
        ...,
        .target(
            name: "{Target Name}",
            dependencies: [
                ...,
                .product(name: "EIQWebBrowser", package: "enliq-ios-ui")
            ]
        ),
        ...
    ]
```

## Usage

### EIQWebBrowser

For detailed usage information, refer to the specific README.md of EIQOfflineControl [here](EIQUserInterface/Sources/EIQWebBrowser/README.md).

## Requirements

- iOS 13.0+
- Swift 5.9+
- Xcode 15.0+

