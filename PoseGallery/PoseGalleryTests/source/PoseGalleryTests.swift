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
import Fabric
import Crashlytics
import Swiftalytics
import XCGLogger

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
    func testAppDelegateConfiguration() {
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        XCTAssertNotNilOptional(delegate, "sharedApplication().delegate does not exist - set host application!")
        XCTAssertNotNilOptional(delegate?.window, "missing main window")
        let root = delegate?.window?.rootViewController as? UITabBarController
        XCTAssertNotNilOptional(root, "missing root tab controller")
        XCTAssertNotNilOptional(root?.viewControllers?[0] as? FirstViewController, "wrong first view controller")
        XCTAssertNotNilOptional(root?.viewControllers?[1] as? SecondViewController, "wrong second view controller")
    }
    
    /// Check that resource configurations are good
    func testAppResources() {
        
        // items copied to NSUserDefaults from plist for settings
        let defaults = NSUserDefaults.standardUserDefaults()
        XCTAssertNotNilOptional(defaults.stringForKey("version_number"), "missing version number");
        XCTAssertNotNilOptional(defaults.stringForKey("build_number"), "missing build number");
        XCTAssertNotNilOptional(defaults.stringForKey("build_date"), "missing build date");
    }
    
    /// Fabric and Crashlytics library configured ok
    func testFabricCrashlytics() {
        // Fabric and Crashlytics library configured ok
        XCTAssertNotNil(Fabric.sharedSDK(), "missing Fabric")
        let crashKey = Crashlytics().apiKey;
        XCTAssertEqual(crashKey, "186ef2a41f30e2ce39a21f35b61600d3ae927290", "wrong Crashlytics apiKey")
    }
    
    /// XCGLogger initialized ok
    func testXCGLogger() {
        XCTAssertTrue(log === XCGLogger.defaultInstance(), "wrong XCGLogger")
    }
    
    /// Swiftalytics initialized ok
    func testSwiftalytics() {
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate,
            top = (delegate?.window?.rootViewController as? UITabBarController)?.viewControllers?[0] as? FirstViewController,
            trackMaster = Swiftalytics.trackingNameForViewController(top!)
        XCTAssertEqualOptional(trackMaster, "FirstViewController (start)")
    }
    
    /// JSQCoreDataKit initialized ok
    func testJSQCoreDataKit() {
//        let stack = (UIApplication.sharedApplication().delegate as! AppDelegate).stack
//        XCTAssertNotNil(stack.model.storeURL, " bad model store")
//        XCTAssertNotNil(stack.model.managedObjectModel, " bad model")
//        XCTAssertNotNil(stack.managedObjectContext, "bad MOC")
//        XCTAssertNotNil(stack.persistentStoreCoordinator, "bad PSC")
//        let event = entity(name: Event.entityName(), context: stack.managedObjectContext)
//        XCTAssertNotNil(event, "bad Event")
    }
    
    /// This is an example of a performance test case.
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
