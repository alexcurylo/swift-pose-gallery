//
// PoseGalleryTests.swift
// PoseGalleryTests
//
// Copyright (c) 2015 Trollwerks Inc. All rights reserved.
//

import UIKit
import XCTest
// don't add AppDelegate to target, PoseGallery.AppDelegate and PoseGalleryTests.AppDelegate become different!
// http://stackoverflow.com/questions/26946677/uiapplication-sharedapplication-delegate-as-appdelegate-causes-exc-bad-access
import PoseGallery

class PoseGalleryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConfiguration() {
        let delegate = UIApplication.sharedApplication().delegate
        XCTAssertNotNil(delegate, "sharedApplication().delegate does not exist - set host application!")
        let appDelegate = delegate as AppDelegate
        XCTAssertTrue(appDelegate.configureSettingsApp(nil), "Settings.app variables not properly set in Info.plist!")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
}
