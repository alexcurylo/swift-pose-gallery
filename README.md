[![Build Status](https://travis-ci.org/alexcurylo/swift-pose-gallery.svg?branch=develop)](https://travis-ci.org/alexcurylo/swift-pose-gallery)
[![Test Coverage Status](https://coveralls.io/repos/github/alexcurylo/swift-pose-gallery/badge.svg?branch=develop)](https://coveralls.io/github/alexcurylo/swift-pose-gallery?branch=develop)
[![Issues](https://img.shields.io/github/issues/alexcurylo/swift-pose-gallery.svg
            )](https://github.com/alexcurylo/swift-pose-gallery/issues)
[![Stories in Ready](https://badge.waffle.io/alexcurylo/swift-pose-gallery.png?label=ready&title=Ready)](https://waffle.io/alexcurylo/swift-pose-gallery)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/alexcurylo/swift-pose-gallery)
[![Language](http://img.shields.io/badge/language-swift_2.2.1-brightgreen.svg)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg)][linkMIT]

[swift-pose-gallery](https://github.com/alexcurylo/swift-pose-gallery)
==================

Pose displaying app engine in Swift 2.2 for iOS 9 -- powers [Poses Professional 3.0 on the App Store](https://itunes.apple.com/us/app/poses-professional-guide-to/id357099619?mt=8&at=10l4B9&ct=SRCreadme)

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

Experimenting with best practices for how to handle what keeps turning out to be a recurring development pattern for us, how to most efficiently ship and maintain branded variations on a common engine. Open sourcing the engine and keeping private the assets of [the App Store-shipping branded version](https://itunes.apple.com/us/app/poses-professional-guide-to/id357099619?mt=8&at=10l4B9&ct=SRCreadme) is pretty much the logical conclusion of that strategy.

## Requirements

- Xcode 7.3.1 or later
- iOS 9.0 or later
 
 Tools:
 
- [Carthage](https://github.com/Carthage/Carthage), for dependency management
- [Fabric](https://fabric.io) account, for Crashlytics crash reporting and Beta distribution
- [ImageMagick](http://www.imagemagick.org) and [Ghostscript](http://www.ghostscript.com), for debug and adhoc [icon tagging](https://gist.github.com/dulaccc/a52154ac4c007db2be55)
- [R.swift](https://github.com/mac-cain13/R.swift/) in /libraries for typed resource identifiers
- [SwiftLint](https://github.com/realm/SwiftLint), for opinionated coding style enforcement

 Libraries (Carthage):

- JSQCoreDataKit: Core Data
- [R.swift.Library](https://github.com/mac-cain13/R.swift.Library) for R.swift support
- [XCGLogger](https://github.com/DaveWoodCom/XCGLogger) for logging

 Resources:
 
- Some interesting pose images

## Usage

Place your images in /resources/branded/brand_images replacing the samples there; set your App Store branding in /resources/branded/brand_PoseGallery.xcconfig.

 `carthage build` to build dependencies -- note that this repo includes Carthage/Checkouts, to avoid [availability failures](http://www.theregister.co.uk/2016/03/23/npm_left_pad_chaos/); `carthage update` to update.

Build the app with the 'PoseGallery' target.
 
## Testing
 
Tests are in the 'PoseGalleryTests' and 'PoseGalleryUITests' targets. Code coverage is enabled; [Travis](https://travis-ci.org/alexcurylo/swift-pose-gallery) builds collect it with [Slather](https://github.com/SlatherOrg/slather) to pass to [Coveralls](https://coveralls.io/github/alexcurylo/swift-pose-gallery?branch=develop) which provides the badged percentage above.

## Documentation
 
Read the [docs](http://alexcurylo.github.io/swift-pose-gallery/). Generated with [jazzy](https://github.com/realm/jazzy). Hosted by [GitHub Pages](https://pages.github.com). More information on the [`gh-pages`](https://github.com/alexcurylo/swift-pose-gallery/tree/gh-pages) branch.

In-app acknowledgements generated with [acknowledge](PoseGallery/PoseGalleryConfig/acknowledge.swift) script using [Markingbird](https://github.com/kristopherjohnson/Markingbird) private Carthage framework, from [Swift Scripting By Example: Generating Acknowledgements For CocoaPods & Carthage Dependencies](http://swift.ayaka.me/posts/2015/11/5/swift-scripting-generating-acknowledgements-for-cocoapods-and-carthage-dependencies)

## Roadmap

Feel free to [open an issue](https://github.com/alexcurylo/swift-pose-gallery/issues/new) if there's something in particular you'd like to see here.

## Author

[![web: trollwerks.com](http://img.shields.io/badge/web-www.trollwerks.com-blue.svg)](http://trollwerks.com) 
[![twitter: @trollwerks](http://img.shields.io/badge/twitter-%40trollwerks-blue.svg)](https://twitter.com/trollwerks) 
[![email: alex@trollwerks.com](http://img.shields.io/badge/email-alex%40trollwerks.com-blue.svg)](mailto:alex@trollwerks.com) 

## License

The [MIT License][linkMIT]. See the [LICENSE](LICENSE) file for details.

>**Copyright &copy; 2016 Trollwerks Inc.**

## Change Log
 
 * **Version 0.0.1-alpha.1**: *(2014.11.24)* - Initial commit
 
[linkMIT]: http://opensource.org/licenses/MIT

