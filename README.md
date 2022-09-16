# Pointzi iOS SDK

[![Version](https://img.shields.io/cocoapods/v/pointzi.svg?style=flat)](http://cocoadocs.org/docsets/pointzi)
[![License](https://img.shields.io/cocoapods/l/pointzi.svg?style=flat)](http://cocoadocs.org/docsets/pointzi)
[![Platform](https://img.shields.io/cocoapods/p/pointzi.svg?style=flat)](http://cocoadocs.org/docsets/pointzi)

Support iOS 13.0 and above.

## Cocoapods Installation

1. Install [CocoaPods](http://cocoapods.org).
2. Add pod line into your Podfile and run "pod install".

    pod "pointzi"

## Pointzi web console

Register App on [Pointzi web console](https://dashboard.pointzi.com/).

[Additional documentation](https://pointzi.freshdesk.com).

## Author

support@pointzi.com

## License

The Pointzi iOS SDK is available under the LGPL license. See the LICENSE file for more info.

## Release Notes
### [2.10.2]
#### Fixed
* Carousel is over the top of preview-mode-widget
* FAQ - elements can be off when its line-height is not set
### [2.10.1] (8/03/2022)
#### Fixed
* The guide that is set 'ONCE' is shown again when a user clicks its BACK button
* Preview modal is dismissed without user action
### [2.10.0] (8/01/2022)
#### Fixed
*  RN crashes
#### Changed
*  Code refactor: remove streethawk-sdk-ios submodule
### [2.9.1] (04/05/2022)
#### Fixed
*  Fixed button launcher icon color
*  Fixed targeting image elements for SwiftUI
*  Stopped displaying the disabled guide
#### Changed
*  Code refactor
### [2.9.0] (8/12/2021)
#### Added
*  App key validation
*  Added validation not to show expired guides
#### Fixed
*  Dashboard and Preview mode  differences fixed
### [2.8.0] (8/11/2021)
#### Added
* Configurable SDK log level via app status
#### Fixed
* Fixed FAQ button launcher disappearing on Bg/FG
