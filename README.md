# ATHExtensions

[![CI Status](http://img.shields.io/travis/attheodo/ATHExtensions.svg?style=flat)](https://travis-ci.org/attheodo/ATHExtensions)
[![Version](https://img.shields.io/cocoapods/v/ATHExtensions.svg?style=flat)](http://cocoapods.org/pods/ATHExtensions)
[![License](https://img.shields.io/cocoapods/l/ATHExtensions.svg?style=flat)](http://cocoapods.org/pods/ATHExtensions)
[![Platform](https://img.shields.io/cocoapods/p/ATHExtensions.svg?style=flat)](http://cocoapods.org/pods/ATHExtensions)

[[https://raw.githubusercontent.com/attheodo/ATHExtensions/master/misc/logo.png alt=Logo]]

A collection of UIKit, Foundation and other framework extensions that I usually use in my projects. 

### Contents

- [Utilities](#utilities)
- [Array](#array-extensions)

## Utilities
There's a bunch of utility properties accessible via the `App` struct.

Project name, version and build numbers:
```swift
print(App.bundleDisplayName)      // Your app's bundle display name
print(App.bundleName)             // Your app's bundle name
print(App.version)                // 1.0.0
print(App.buildNumber)            // 1
print(App.versionWithBuildNumber) // v1.0.0 (b1)
```

Runtime environment and configuration:
```swift
print(App.isDebug)              // true if Debug configuration is enabled
print(App.isRelease)            // true if Release configuration is enabled
print(App.isBeingTest)          // true if app is running in testing mode
print(App.isBeingUITested)      // true if app is running in UI testing mode
print(App.isRunningOnSimulator) // true if app is being run on the simulator
print(App.isRunningOnDevice)    // true if app is being run on a device

let delegate = App.delegete as! AppDelegate // A reference to the app delegate
```

Detect whether app has been launched before:
```swift
print(App.isFirstLaunch)                  // true if the app has never ran before on that device
print(App.isFirstLaunchForCurrentVersion) // true if the current version of the app has never run before
```
## Array Extensions

Removes first occurence of an item from an array:
```swift
var array = [1, 2, 3, 4, 2]
array.removeObject(2) // [1, 3, 4, 2]
```

Remove all occurences of an item from an array:
```swift
var array = [1, 2, 3, 4, 2]
array.removeAllOccurencesOfObject(2) // [1, 3, 4]
```

Get all the indices where an object appears in the array
```swift
var array = ["iPhone", "iPhone", "iPad", "iPhone"]
print(array.indexesOf("iPhone")) // [0, 1, 3]
print(array.indicesOf("iPad")) // [2]
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ATHExtensions is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ATHExtensions"
```

## Author

attheodo, at@atworks.gr

## License

ATHExtensions is available under the MIT license. See the LICENSE file for more info.
