# ATHExtensions

[![CI Status](http://img.shields.io/travis/attheodo/ATHExtensions.svg?style=flat)](https://travis-ci.org/attheodo/ATHExtensions)
[![Version](https://img.shields.io/cocoapods/v/ATHExtensions.svg?style=flat)](http://cocoapods.org/pods/ATHExtensions)
[![License](https://img.shields.io/cocoapods/l/ATHExtensions.svg?style=flat)](http://cocoapods.org/pods/ATHExtensions)
[![Platform](https://img.shields.io/cocoapods/p/ATHExtensions.svg?style=flat)](http://cocoapods.org/pods/ATHExtensions)
[![Language](https://img.shields.io/badge/language-Swift%202.0%20/%202.1%20/%202.2-orange.svg)](https://developer.apple.com/swift/)

[![Logo](misc/logo.png  "ATHExtensions")](/)

A collection of UIKit, Foundation and other framework extensions that I usually use in my projects. 

### Contents

- [Utilities](#utilities)
- [Array Extensions](#array-extensions)
- [NSMutableAttributedString Extensions](#nsmutableattributestring-extensions)
- [Dictionary Extensions](#dictionary-extensions)
- [UIColor Extensions](#uicolor-extensions)
- [UIView Extensions](#uiview-extensions)
- [UIViewController Extensions](#uiviewcontroller-extensions)

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

## NSMutableAttributedString Extensions

Conveniently change the color of a substring which is part of an `NSMutableAttributedString`

```swift
let text = NSMutableAttributedString(string: "Hello I am a tomato!")
text.setColorForString("tomato", color: UIColor.redColor())
```

## Dictionary Extensions

Check if a `Dictionary` contains a key:

```swift
let dict = ["Hodor": "dead", "John Snow": "resurrected", "Stanis Baratheon": "dead"]
dict.containsKey("Hodor") // true
```

## UIColor Extensions

Convenience initialisers to work more easily with colors:

```swift
var blackColor = UIColor(hex: "#000", alpha: 1.0)     // black color
    blackColor = UIColor(hex: "#000000", alpha: 1.0)  // black color too

var whiteColor = UIColor(hex: "#FFF", alpha: 1.0)    // white color
    whiteColor = UIColor(hex: "#FFFFFF", alpha: 1.0) // white color too
    
let rgbWhiteColor = UIColor(r: 255.0, g: 255.0, b: 255.0)                        // white color using RGB values from 0 to 255
let rgbWhiteColorTransparent = UIColor(r: 255.0, g: 255.0, b: 255.0, alpha: 0.5) // alpha supported too
```

## UIView Extensions

UIView size and origin:

```swift
let view = UIView()
print(view.x) // equal to view.frame.origin.x (also settable)
print(view.y) // equal to view.frame.origin.y (also settable)
print(view.width) // equal to view.frame.size.width (also settable)
print(view.height) // equal to view.frame.size.height (also settable)
print(view.leading // equal to view.frame.origin.x (also settable)
print(view.trailing) // equal to view.frame.origin.x + view.width (also settable)
print(view.top) // equal to view.frame.origin.y (also settable)
print(view.bottom) // equal to view.frame.origin.y + view.heigh (also settable)
```

Add borders and rounder corners to `UIView`s:

```swift
let view = UIView()
view.setCornerRadius(10.0) // changes view's corner raidus
view.addBorderWithWidth(1.0, andColor: UIColor.blackColor()) // Adds a 1px black border color
view.addTopBorderWithSize(1.0, andColor: UIColor.redColor()) // Adds a 1px red border on the top of the view
view.addBottomBorderWithSize(1.0, andColor: UIColor.greenColor()) // Adds a 1px green border color on the bottom of the view
view.addLeftBorderWithSize(1.0, andColor: UIColor.orangeColor()) // Adds a 1px orange color on the left of the view
view.addRightBorderWithSize(1.0, andColor: UIColor.yellowColor()) // Adds a 1px yellow color on the right of the view
```

Fade in/out a `UIView`:

```swift
let view = UIView()
view.alpha = 0
view.fadeIn() // Fades the view in
view.fadeOut() // Fades the view out

// Or more customizable
view.fadeIn(duration: 5, delay: 1) { animation in
    print("animation ended!")
}
```

## UIViewController Extensions

Get a reference to app's delegate:

```swift
override func viewDidLoad() {
  super.viewDidLoad()
  
  let appDelegate = myVC.appDelegate as! AppDelegate

}
```
Get a reference to the navigation bar if any:

```swift
override func viewDidLoad() {
  super.viewDidLoad()
  
  self.navigationBar.tintColor = UIColor.blackColor()

}
```

Get or set the navigation bar `titleView`:

```swift
override func viewDidLoad() {
  super.viewDidLoad()
  
  self.titleView = UIImageView(image: UIImage(named: "logo))

}
```

Easily present new view controllers or dismiss self:

```swift
override func viewDidLoad() {
  super.viewDidLoad()
  
  let myVC = MyViewController()
  
  present(myVC)  // Presents myVC modally
  self.dismiss() // Dismisses self
  
}
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
