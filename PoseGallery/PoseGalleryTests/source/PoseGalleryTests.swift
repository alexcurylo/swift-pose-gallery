//
// PoseGalleryTests.swift
// PoseGalleryTests
//
// Copyright © 2016 Trollwerks Inc. All rights reserved.
//

// latest roundup: http://www.alexcurylo.com/blog/2014/07/25/xcode-6-usable-testing/
// profiling: https://www.shinobicontrols.com/blog/posts/2014/07/25/ios8-day-by-day-day-6-profiling-unit-tests
// async: https://www.shinobicontrols.com/blog/posts/2014/08/01/ios8-day-by-day-day-11-asynchronous-testing

import XCTest
@testable import PoseGallery
import Crashlytics
import Fabric
import XCGLogger

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
        XCTAssertNilOptional(optional, message: "XCTAssertNilOptional broken?")
        optional = "option"
        XCTAssertNotNilOptional(optional, message: "XCTAssertNotNilOptional broken?")
        XCTAssertEqualOptional(a: optional, b: "option", "XCTAssertEqualOptional broken?")
    }

    /// Check that setup, target plist and main storyboard are good
    func testAppDelegateConfiguration() {
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        XCTAssertNotNilOptional(delegate, message: "sharedApplication().delegate does not exist - set host application!")
        XCTAssertNotNilOptional(delegate?.window, message: "missing main window")
        let root = delegate?.window?.rootViewController as? UITabBarController
        XCTAssertNotNilOptional(root, message: "missing root tab controller")
        XCTAssertNotNilOptional(root?.viewControllers?[0] as? FirstViewController, message: "wrong first view controller")
        XCTAssertNotNilOptional(root?.viewControllers?[1] as? SecondViewController, message: "wrong second view controller")
    }

    /// Check that resource configurations are good
    func testAppResources() {
        // items copied to NSUserDefaults from plist for settings
        let defaults = NSUserDefaults.standardUserDefaults()
        XCTAssertNotNilOptional(defaults.stringForKey("version_number"), message: "missing version number")
        XCTAssertNotNilOptional(defaults.stringForKey("build_number"), message: "missing build number")
        XCTAssertNotNilOptional(defaults.stringForKey("build_date"), message: "missing build date")

        // images and storyboards, as provided by R.swift
        R.assertValid()
        XCTAssertNotNilOptional(try? R.validate(), message: "Invalid resources")
    }

    /// Fabric and Crashlytics library configured ok
    func testFabricCrashlytics() {
        let fabricSettings = NSBundle.mainBundle().objectForInfoDictionaryKey("Fabric") as? [String: AnyObject]
        let fabricKey = fabricSettings?["APIKey"] as? String
        XCTAssertNotNil(fabricKey, "missing Info.plist Fabric settings")
        XCTAssert(!(fabricKey ?? "").isEmpty, "Fabric API key should not be empty")
        XCTAssertNotNil(Fabric.sharedSDK(), "missing Fabric")

        let crashlytics = Crashlytics.sharedInstance()
        XCTAssertNotNil(crashlytics, "missing Crashlytics")
        XCTAssertEqual(crashlytics.version, "3.7.0", "unexpected Crashlytics version")
        XCTAssertEqual(crashlytics.APIKey, fabricKey, "unexpected Crashlytics APIKey")
    }

    /// XCGLogger initialized ok
    func testXCGLogger() {
        XCTAssertTrue(log === XCGLogger.defaultInstance(), "wrong XCGLogger")
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
