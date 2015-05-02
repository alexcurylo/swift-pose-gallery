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
import XCGLogger
import Fabric
import Crashlytics

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
    
    /// Make sure our extensions perform as expected
    func testOptionalTests() {
        var optional: String?
        XCTAssertNilOptional(optional, "XCTAssertNilOptional broken?")
        optional = "option"
        XCTAssertNotNilOptional(optional, "XCTAssertNotNilOptional broken?")
        XCTAssertEqualOptional(optional, "option", "XCTAssertEqualOptional broken?")
    }
    
    /// Check that setup, target plist and main storyboard are good
    func testConfiguration() {
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        XCTAssertNotNilOptional(delegate, "sharedApplication().delegate does not exist - set host application!")
        XCTAssertNotNilOptional(delegate?.window, "missing main window")
        let root = delegate?.window?.rootViewController as? UITabBarController
        XCTAssertNotNilOptional(root, "missing root tab controller")
        XCTAssertNotNilOptional(root?.viewControllers?[0] as? FirstViewController, "wrong first view controller")
        XCTAssertNotNilOptional(root?.viewControllers?[1] as? SecondViewController, "wrong second view controller")

        XCTAssertTrue(delegate!.configureSettingsApp(nil), "Settings.app variables not properly set in Info.plist!")
    }
    
    /// Check that external dependencies are good
    func testDependenciesConfiguration() {
        
        // Fabric and Crashlytics library configured ok
        XCTAssertNotNil(Fabric.sharedSDK(), "missing Fabric")
        let crashKey = Crashlytics().apiKey;
        XCTAssertEqual(crashKey, "99cec92a3fd08dcc72275ff9d713c1150c1e9c31", "wrong Crashlytics apiKey")
        
        // XCGLogger was initialzed ok
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        XCTAssertTrue(delegate!.log === XCGLogger.defaultInstance(), "wrong XCGLogger?")
        
    }
    
    /// This is an example of a performance test case.
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
}
