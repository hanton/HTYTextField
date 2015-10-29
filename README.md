# HTYTextField
## A UITextField with bouncy placeholder.

Screenshot
----------

![screenshot](https://github.com/hanton/HTYTextField/blob/master/screenshot/HTYTextField.gif)

Installation
-----

**CocoaPods**

* Add the dependency to your Podfile:
```ruby
use_frameworks!

pod 'HTYTextField'
...
```

* Run `pod install` to install the dependencies.

**Source files**

Just clone this repository or download it in zip-file. Then you will find source files under **HTYTextField** directory. Copy them to your project.

Usage
-----
* Import the header file to your view controller:
```swift
import HTYTextField

@IBOutlet weak var emailTextField: HTYTextField!
@IBOutlet weak var passwordTextField: HTYTextField!
  
emailTextField.rightPlaceholder = "xxx@xxx.xx"
passwordTextField.rightPlaceholder = "6~12 digits"
```

Requirements
----------
- iOS 8.0+
- Xcode 7+
- Swift 2+

Contributing
----------
Anyone who would like to contribute to the project is more than welcome.

* Fork this repo
* Make your changes
* Submit pull request

## License
HTYTextField is released under the MIT license. 

Contact
----------
Hanton Yang (hanton.yang@gmail.com)
