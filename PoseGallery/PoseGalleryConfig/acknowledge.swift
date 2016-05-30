#!/usr/bin/env xcrun swift -F Carthage/Build/Mac

//
// acknowledge.swift
// PoseGallery
//
// Copyright © 2016 Trollwerks Inc. All rights reserved.
//
// "Swift Scripting By Example: Generating Acknowledgements For CocoaPods & Carthage Dependencies"
// http://swift.ayaka.me/posts/2015/11/5/swift-scripting-generating-acknowledgements-for-cocoapods-and-carthage-dependencies
//

import Foundation
import Markingbird

protocol Streamable {
    var title: String { get }
    var body: String { get }
}

extension Streamable {
    var writableString: String {
        return "# \(title)\n\n\(body)"
    }
}

struct License: Streamable {
    let libraryName: String
    let legalText: String

    var title: String {
        return libraryName
    }

    var body: String {
        return legalText
    }
}

func getLicense(URL: NSURL) throws -> License {
    let legalText = try String(contentsOfURL: URL, encoding: NSUTF8StringEncoding)
    let pathComponents = URL.pathComponents!
    let libraryName = pathComponents[pathComponents.count - 2]
    return License(libraryName: libraryName, legalText: legalText)
}

func run() throws {

    let cocoaPodsDir = "Pods/"
    let carthageDir = "Carthage/Checkouts/"
    let outputFile = "Venmo/Resources/LICENSES.html"
    let options: NSDirectoryEnumerationOptions = [.SkipsPackageDescendants, .SkipsHiddenFiles]

    let fileManager = NSFileManager.defaultManager()


    // Get URL’s for all files in cocoaPodsDir and carthageDir

    guard
        let cocoaPodsDirURL = NSURL(string: cocoaPodsDir),
        let cocoaPodsEnumerator = fileManager.enumeratorAtURL(cocoaPodsDirURL, includingPropertiesForKeys: nil, options: options, errorHandler: nil)
    else {
        print("Error: \(cocoaPodsDir) directory not found. Please run `rake`")
        return
    }

    guard
        let carthageDirURL = NSURL(string: cocoaPodsDir),
        let carthageEnumerator = fileManager.enumeratorAtURL(carthageDirURL, includingPropertiesForKeys: nil, options: options, errorHandler: nil)
    else {
        print("Error: \(carthageDir) directory not found. Please run `rake`")
        return
    }

    guard
        let cocoaPodsURLs = cocoaPodsEnumerator.allObjects as? [NSURL],
        let carthageURLs = carthageEnumerator.allObjects as? [NSURL]
    else {
        print("Unexpected error: Enumerator contained item that is not NSURL.")
        return
    }

    let allURLs = cocoaPodsURLs + carthageURLs


    // Get just the LICENSE files and convert them to License structs

    let licenseURLs = allURLs.filter { URL in
        return URL.lastPathComponent?.rangeOfString("LICENSE") != nil || URL.lastPathComponent?.rangeOfString("LICENCE") != nil
    }

    let licenses = licenseURLs.flatMap { try? getLicense($0) }


    // Write each License into outputFile after converting them to HTML using Markingbird

    var markdown = Markdown()
    let html = licenses.map { markdown.transform($0.writableString) }.joinWithSeparator("\n")

    try html.writeToFile(outputFile, atomically: false, encoding: NSUTF8StringEncoding)
}

func main() {
    do {
        try run()
    } catch let error as NSError {
        print(error.localizedDescription)
    }
}

main()
