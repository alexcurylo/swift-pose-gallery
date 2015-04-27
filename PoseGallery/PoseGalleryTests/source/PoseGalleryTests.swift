//
// PoseGalleryTests.swift
// PoseGalleryTests
//
// Copyright (c) 2015 Trollwerks Inc. All rights reserved.
//

// latest roundup: http://www.alexcurylo.com/blog/2014/07/25/xcode-6-usable-testing/
// profiling: https://www.shinobicontrols.com/blog/posts/2014/07/25/ios8-day-by-day-day-6-profiling-unit-tests
// async: https://www.shinobicontrols.com/blog/posts/2014/08/01/ios8-day-by-day-day-11-asynchronous-testing

import UIKit
import XCTest

// don't add AppDelegate to target, PoseGallery.AppDelegate and PoseGalleryTests.AppDelegate become different!
// http://stackoverflow.com/questions/26946677/uiapplication-sharedapplication-delegate-as-appdelegate-causes-exc-bad-access
import PoseGallery

// also problems with adding view controllers that are instantiated from storyboards

class PoseGalleryTests: XCTestCase {
    
    /// Put setup code here. This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
    }
    
    /// Put teardown code here. This method is called after the invocation of each test method in the class.
    override func tearDown() {
        super.tearDown()
    }
    
    /// Check that setup, target plist and main storyboard are good
    func testConfiguration() {
        let delegate = UIApplication.sharedApplication().delegate
        XCTAssertNotNil(delegate, "sharedApplication().delegate does not exist - set host application!")
        let appDelegate = delegate as! AppDelegate
        XCTAssertNotNil(appDelegate.window)
        XCTAssertNotNil(appDelegate.window!.rootViewController as? UITabBarController)
        let tabController = appDelegate.window!.rootViewController as! UITabBarController
        XCTAssertEqual(tabController.viewControllers!.count, 2)
        XCTAssertNotNil(tabController.viewControllers![0] as? FirstViewController)
        XCTAssertNotNil(tabController.viewControllers![1] as? SecondViewController)

        XCTAssertTrue(appDelegate.configureSettingsApp(nil), "Settings.app variables not properly set in Info.plist!")
    }
    
    /// This is an example of a performance test case.
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
}
