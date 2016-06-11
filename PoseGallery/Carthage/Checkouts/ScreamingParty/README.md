# [ScreamingParty](https://github.com/alexcurylo/ScreamingParty)
[![Language](http://img.shields.io/badge/language-swift_2.2.1-orange.svg)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg)][linkMIT] 

[comment]: # (CocoaPods badges: [![Version Status](https://img.shields.io/cocoapods/v/JSQCoreDataKit.svg)][podLink] [![Platform](https://img.shields.io/cocoapods/p/JSQCoreDataKit.svg)][podLink] [![license MIT](https://img.shields.io/cocoapods/l/JSQCoreDataKit.svg)][linkMIT])

Swift utilities collection. *“The screaming helps the birds bond as a [screaming party...](https://www.youtube.com/watch?v=gA925WlKKF4)”*

## Table of Contents

1. [Purpose](#purpose)
2. [Requirements](#requirements)
3. [Usage](#usage)
4. [Testing](#testing)
5. [Documentation](#documentation)
6. [Roadmap](#roadmap)
7. [Author](#author)
8. [License](#license)
9. [Change Log](#change-log)

## Purpose

Collecting [MIT-licensable](linkMIT) snippets, gists, small packages and so forth into a single stably versioned package.

## Requirements

- Xcode 7.3.1 or later
- iOS 9.3 or later

Tools:

- TODO: SwiftLint

## Usage

- [Carthage](https://github.com/alexcurylo/ScreamingParty): No tags yet, so

    ```
    github "alexcurylo/ScreamingParty" "HEAD"
    ```

- [Swift Package Manager](https://swift.org/package-manager) [Untested!]:
 
    ```swift
    import PackageDescription

    let package = Package(
        name: "YourApp",
        targets: [],
        dependencies: [
            .Package(url: "https://github.com/alexcurylo/ScreamingParty.git",
                     majorVersion: 0),
        ]
    )
    ```

- [CocoaPods](https://cocoapods.org) [Not deployed!]:

    ```ruby
    pod 'ScreamingParty'
    ```

To use directly, build the framework with the 'ScreamingParty' target.
 
## Testing

Tests are in the 'ScreamingPartyTests' target.

- TODO: Code coverage

## Documentation

- TODO: Github docs
- TODO: Generate acknowledgements for embedded sources 

Embedded sources:

- [Then](https://github.com/devxoul/Then) v1.0.3: ✨ Super sweet syntactic sugar for Swift initializers.

## Roadmap

Feel free to [open an issue](https://github.com/alexcurylo/ScreamingParty/issues/new) if there's something in particular you'd like to see added.

## Author

[![web: trollwerks.com](http://img.shields.io/badge/web-www.trollwerks.com-blue.svg)](http://trollwerks.com) 
[![twitter: @trollwerks](http://img.shields.io/badge/twitter-%40trollwerks-blue.svg)](https://twitter.com/trollwerks) 
[![email: alex@trollwerks.com](http://img.shields.io/badge/email-alex%40trollwerks.com-blue.svg)](mailto:alex@trollwerks.com) 

## License

The [MIT License][linkMIT]. See the [LICENSE](LICENSE) file for details.

>** ScreamingParty Copyright &copy; 2016 Trollwerks Inc.**
 
>• [Then](https://github.com/devxoul/Then) Copyright &copy; 2015 Suyeol Jeon (xoul.kr)

## Change Log

* **Version 0.0.1-alpha.1**: *(2016.06.08)* - Initial commit

[linkMIT]: http://opensource.org/licenses/MIT

