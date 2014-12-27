[![Build Status](https://travis-ci.org/alexcurylo/swift-pose-gallery.svg?branch=master)](https://travis-ci.org/alexcurylo/swift-pose-gallery)
[![Stories in Ready](https://badge.waffle.io/alexcurylo/swift-pose-gallery.png?label=ready&title=Ready)](https://waffle.io/alexcurylo/swift-pose-gallery)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/alexcurylo/swift-pose-gallery?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
<!---
  # https://github.com/venmo/slather/issues/39 -- track Swift support status
  [![Coverage Status](https://coveralls.io/repos/alexcurylo/swift-pose-gallery/badge.png)](https://coveralls.io/r/alexcurylo/swift-pose-gallery)
--> 
 
 swift-pose-gallery
==================
 
 Pose displaying app engine in Swift for iOS 8 -- powers [Poses Professional 3.0 on the App Store](https://itunes.apple.com/us/app/poses-professional-guide-to/id357099619?mt=8&at=10l4B9&ct=SRCreadme)
 
## Table of Contents
 
 1. [Purpose](#purpose)
 2. [Requirements](#requirements)
 3. [Usage](#usage)
 4. [Roadmap](#roadmap)
 5. [Author](#author)
 6. [License](#license)
  
## Purpose
  
- Experimenting with best practices for how to handle what keeps turning out to be a recurring development pattern for us, how to most efficiently ship and maintain branded variations on a common engine. Open sourcing the engine and keeping private the assets of [the App Store-shipping branded version](https://itunes.apple.com/us/app/poses-professional-guide-to/id357099619?mt=8&at=10l4B9&ct=SRCreadme) is pretty much the logical conclusion of that strategy.
 
- Demonstrating our current grasp of Swift idioms, and encouraging people to improve said grasp; as they say, "the best way to get the right answer on the Internet is not to ask a question, it's to post the wrong answer." [This is called Godwin's Law](http://meta.wikimedia.org/wiki/Cunningham%27s_Law). So if you see anything you figure could be done more Swiftily, or just plain better, correct away!
 

## Requirements
  
 - iOS, minimum version 8.0
 - Some interesting pose images

## Usage
 
 1. Place your images in /resource/branded replacing the samples there.
 2. Set your App Store branding in /resources/branded/brand_PoseGallery.xcconfig.
 3. Build and run!

## Roadmap
 
Feel free to [open an issue](https://github.com/alexcurylo/swift-pose-gallery/issues/new) if there's something in particular you'd like to see here. Or, preferably, a pull request!

## Author
 
 [Alex Curylo](http://www.alexcurylo.com/), [@trollwerks](https://www.twitter.com/trollwerks)

## License

 The [MIT License](http://opensource.org/licenses/MIT). See the LICENSE file for details.