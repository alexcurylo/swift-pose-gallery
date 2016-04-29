[![Build Status](https://travis-ci.org/alexcurylo/swift-pose-gallery.svg?branch=develop)](https://travis-ci.org/alexcurylo/swift-pose-gallery)
[![Coverage Status](https://coveralls.io/repos/alexcurylo/swift-pose-gallery/badge.png)](https://coveralls.io/r/alexcurylo/swift-pose-gallery)
[![Issues](https://img.shields.io/github/issues/alexcurylo/swift-pose-gallery.svg?style=flat
            )](https://github.com/alexcurylo/swift-pose-gallery/issues)
[![Stories in Ready](https://badge.waffle.io/alexcurylo/swift-pose-gallery.png?label=ready&title=Ready)](https://waffle.io/alexcurylo/swift-pose-gallery)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/alexcurylo/swift-pose-gallery)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](http://mit-license.org)

[swift-pose-gallery](https://github.com/alexcurylo/swift-pose-gallery)
==================

Pose displaying app engine in Swift 2.2 for iOS 9 -- powers [Poses Professional 3.0 on the App Store](https://itunes.apple.com/us/app/poses-professional-guide-to/id357099619?mt=8&at=10l4B9&ct=SRCreadme)

## Table of Contents

1. [Purpose](#purpose)
2. [Requirements](#requirements)
3. [Usage](#usage)
4. [Roadmap](#roadmap)
5. [Author](#author)
6. [License](#license)
7. [Change Log](#change-log)

## Purpose

- Experimenting with best practices for how to handle what keeps turning out to be a recurring development pattern for us, how to most efficiently ship and maintain branded variations on a common engine. Open sourcing the engine and keeping private the assets of [the App Store-shipping branded version](https://itunes.apple.com/us/app/poses-professional-guide-to/id357099619?mt=8&at=10l4B9&ct=SRCreadme) is pretty much the logical conclusion of that strategy.

## Requirements

- Xcode 7.3.1 or later
- iOS 9.0 or later
- [jazzy](https://github.com/realm/jazzy), for automatic documentation generation
- [ImageMagick](http://www.imagemagick.org) and [Ghostscript](http://www.ghostscript.com), for debug and adhoc [icon tagging](https://gist.github.com/dulaccc/a52154ac4c007db2be55)
- [Fabric](https://fabric.io) account, for Crashlytics crash reporting and Beta distribution
- [R.swift](https://github.com/mac-cain13/R.swift/) in /libraries for typed resource identifiers
- [Carthage](https://github.com/Carthage/Carthage), for dependency management:
- [XCGLogger](https://github.com/DaveWoodCom/XCGLogger) for logging
- Some interesting pose images

## Usage

Place your images in /resources/branded/brand_images replacing the samples there; set your App Store branding in /resources/branded/brand_PoseGallery.xcconfig.

 `carthage build --platform iOS` to build checked in dependencies; `carthage update --platform iOS` to update.

Build the app with the 'PoseGallery' target. Tests are in the 'PoseGalleryTests' target.
 
Build source code documentation in /PoseGallery/docs/ with the 'Documentation' target.

## Roadmap

Feel free to [open an issue](https://github.com/alexcurylo/swift-pose-gallery/issues/new) if there's something in particular you'd like to see here.

## Author

[![web: trollwerks.com](http://img.shields.io/badge/web-www.trollwerks.com-green.svg?style=flat)](http://trollwerks.com) 
[![twitter: @trollwerks](http://img.shields.io/badge/twitter-%40trollwerks-blue.svg?style=flat)](https://twitter.com/trollwerks) 
[![email: alex@trollwerks.com](http://img.shields.io/badge/email-alex%40trollwerks.com-orange.svg?style=flat)](mailto:alex@trollwerks.com) 

## License

The [MIT License](http://opensource.org/licenses/MIT). See the [LICENSE](LICENSE) file for details.
 
## Change Log
 
 * **Version 1.0**: *(????.??.??)* - Initial Release

