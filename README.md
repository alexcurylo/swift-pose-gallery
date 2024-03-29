[swift-pose-gallery](https://github.com/alexcurylo/swift-pose-gallery)
====================
[![Build Status](https://travis-ci.org/alexcurylo/swift-pose-gallery.svg?branch=develop)](https://travis-ci.org/alexcurylo/swift-pose-gallery)
[![Coverage Status](https://coveralls.io/repos/github/alexcurylo/swift-pose-gallery/badge.svg?branch=develop)](https://coveralls.io/github/alexcurylo/swift-pose-gallery?branch=develop)
[![Issues](https://img.shields.io/github/issues/alexcurylo/swift-pose-gallery.svg
            )](https://github.com/alexcurylo/swift-pose-gallery/issues)
[![Language](http://img.shields.io/badge/language-swift_3-orange.svg)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg)][linkMIT]

Pose displaying app engine in Swift 3 for iOS 11 -- superseded by [poses](https://github.com/alexcurylo/poses) for SwiftUI

Table of Contents
-----------------
 
 1. [Purpose](#purpose)
 2. [Requirements](#requirements)
 3. [Usage](#usage)
 4. [Testing](#testing)
 5. [Documentation](#documentation)
 6. [Roadmap](#roadmap)
 7. [Author](#author)
 8. [License](#license)
 
Purpose
-------

 Experimenting with best practices for how to handle efficiently shipping and maintaining branded variations on a common engine using Xcode.

Requirements
------------
 
 - Xcode 9.3 or later
 - iOS 11.0 or later

### Tools:
 
 - [Carthage](https://github.com/Carthage/Carthage), for dependency management
 - [Fabric](https://fabric.io) account, for Crashlytics crash reporting and Beta distribution
 - [ImageMagick](http://www.imagemagick.org) and [Ghostscript](http://www.ghostscript.com), for debug and adhoc [icon tagging](https://gist.github.com/dulaccc/a52154ac4c007db2be55)
 - [R.swift](https://github.com/mac-cain13/R.swift/) in /libraries for typed resource identifiers
 - [SwiftLint](https://github.com/realm/SwiftLint), for opinionated coding style enforcement
 
 NB. Crashlytics/Fabric currently broken
 https://github.com/CocoaPods/CocoaPods/issues/5598
 http://www.openradar.me/radar?id=5045072026402816

### Libraries (Carthage):

 - [JSQCoreDataKit](https://github.com/jessesquires/JSQCoreDataKit) for Core Data conveniences
 - [R.swift.Library](https://github.com/mac-cain13/R.swift.Library) for R.swift support
 - [ScreamingParty](https://github.com/alexcurylo/ScreamingParty) for general utilities
 - [SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver) for logging
 
 - [SuperDelegate](https://github.com/square/SuperDelegate) for lifecycle management
 - [SwiftIconFont](https://github.com/0x73/SwiftIconFont) for icon fonts

### Resources:
 
 - Some interesting pose images

Usage
-----
 
Place your images in /resources/branded/brand_images replacing the samples there; set your App Store branding in /resources/branded/brand_PoseGallery.xcconfig.

`carthage build` to build dependencies -- note that this repo includes `Carthage/Checkouts`, to avoid [availability failures](http://www.theregister.co.uk/2016/03/23/npm_left_pad_chaos/); `carthage update` to update.

Build the app with the 'PoseGallery' target.
 
Note that a "Module file was created by an older version of the compiler..." error probably indicates that you're using an Xcode beta that xcodebuild needs to be told to use: `sudo xcode-select -s /Applications/Xcode-Beta.app`. And that you should use `carthage update --no-use-binaries`.
 
Testing
-------
 
Tests are in the 'PoseGalleryTests' and 'PoseGalleryUITests' targets. Code coverage is enabled; [Travis](https://travis-ci.org/alexcurylo/swift-pose-gallery) builds collect it with [Slather](https://github.com/SlatherOrg/slather) to pass to [Coveralls](https://coveralls.io/github/alexcurylo/swift-pose-gallery?branch=develop) which provides the badged percentage above.

Documentation
-------------
 
Read the [docs](http://alexcurylo.github.io/swift-pose-gallery/). Generated with [jazzy](https://github.com/realm/jazzy). Hosted by [GitHub Pages](https://pages.github.com). More information on the [`gh-pages`](https://github.com/alexcurylo/swift-pose-gallery/tree/gh-pages) branch.

[NB. Currently suspended until Markingbird is Swift 3 friendly] In-app acknowledgements generated with [acknowledge](PoseGallery/PoseGalleryConfig/acknowledge.swift) script using [Markingbird](https://github.com/kristopherjohnson/Markingbird) private Carthage framework, from [Swift Scripting By Example: Generating Acknowledgements For CocoaPods & Carthage Dependencies](http://swift.ayaka.me/posts/2015/11/5/swift-scripting-generating-acknowledgements-for-cocoapods-and-carthage-dependencies)

Roadmap
-------
 
Feel free to [open an issue](https://github.com/alexcurylo/swift-pose-gallery/issues/new) if there's something in particular you'd like to see here.

Author
------
 
[![web: trollwerks.com](http://img.shields.io/badge/web-www.trollwerks.com-blue.svg)](http://trollwerks.com) 
[![twitter: @trollwerks](http://img.shields.io/badge/twitter-%40trollwerks-blue.svg)](https://twitter.com/trollwerks) 
[![email: alex@trollwerks.com](http://img.shields.io/badge/email-alex%40trollwerks.com-blue.svg)](mailto:alex@trollwerks.com) 

License
-------
 
The [MIT License][linkMIT]. See the [LICENSE](LICENSE) file for details.

>**Copyright &copy;2008-2019 Trollwerks Inc.**

[linkMIT]: http://opensource.org/licenses/MIT
