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
//import Crashlytics
//import Fabric
//import SwiftyBeaver

final class PoseGalleryTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    /// Make sure our extensions perform as expected
    func testOptionalTests() {
        var optional: String?
        XCTAssertNilOptional(expression: optional, message: "XCTAssertNilOptional broken?")
        optional = "option"
        XCTAssertNotNilOptional(expression: optional, message: "XCTAssertNotNilOptional broken?")
        //XCTAssertEqualOptional(a: optional, b: "option", "XCTAssertEqualOptional broken?")
    }

    /// Check that setup, target plist and main storyboard are good
    func testAppDelegateConfiguration() {
        let app = UIApplication.shared
        let delegate = app.delegate as? AppDelegate
        XCTAssertNotNilOptional(expression: delegate, message: "sharedApplication().delegate does not exist - set host application")
        XCTAssertNotNilOptional(expression: delegate?.window, message: "missing main window")
        let root = delegate?.window?.rootViewController as? UITabBarController
        XCTAssertNotNilOptional(expression: root, message: "missing root tab controller")
        XCTAssert(root?.viewControllers?.count == 2, "wrong number of tabs")
        XCTAssertNotNilOptional(expression: root?.viewControllers?[0] as? FirstViewController, message: "wrong first view controller")
        XCTAssertNotNilOptional(expression: root?.viewControllers?[1] as? SecondViewController, message: "wrong second view controller")
    }

    /// check for any fatal UIApplicationDelegate side effects
    func testAppDelegateDelegation() {
        let app = UIApplication.shared
        let delegate = app.delegate as? AppDelegate

        delegate?.applicationWillResignActive(app)
        delegate?.applicationDidEnterBackground(app)
        delegate?.applicationWillEnterForeground(app)
        delegate?.applicationDidBecomeActive(app)
        delegate?.applicationWillTerminate(app)
    }

    // Check low memory handlers are called
    func testLowMemoryHandling() {
        let app = UIApplication.shared

        // Note we rely on MemoryWarner.h via the bridging header to expose private selector
        UIControl().sendAction(#selector(UIApplication._performMemoryWarning), to: app, for: nil)

        // Currently implemented without effect aside from console notes:
        // INFO: AppDelegate applicationDidReceiveMemoryWarning
        // INFO: FirstViewController didReceiveMemoryWarning
        // INFO: SecondViewController didReceiveMemoryWarning
    }

    /// Check that resource configurations are good
    func testAppResources() {
        // items copied to NSUserDefaults from plist for settings
        let defaults = UserDefaults.standard
        XCTAssertNotNilOptional(expression: defaults.string(forKey: "version_number"), message: "missing version number")
        XCTAssertNotNilOptional(expression: defaults.string(forKey: "build_number"), message: "missing build number")
        XCTAssertNotNilOptional(expression: defaults.string(forKey: "build_date"), message: "missing build date")
        /*
        // R.swift provided diagnostics
        R.assertValid()
        XCTAssertNotNilOptional(try? R.validate(), message: "Invalid resources")

        // exercise generated code as much as possible

        XCTAssertNotNilOptional(R.file.settingsBundle(), message: "Missing settingsBundle")

        let _ = R.image.first()
        let _ = R.image.second()

        let _ = R.nib.launchScreen()
        let _ = R.nib.launchScreen.firstView(owner: nil)

        let _ = R.storyboard.main()
        XCTAssertNotNilOptional(try? _R.storyboard.main.validate(), message: "Invalid resources")
         */
    }

    /// Fabric and Crashlytics library configured ok
    func testFabricCrashlytics() {
        let fabricSettings = Bundle.main.object(forInfoDictionaryKey: "Fabric") as? [String: AnyObject]
        let fabricKey = fabricSettings?["APIKey"] as? String
        XCTAssertNotNil(fabricKey, "missing Info.plist Fabric settings")
        XCTAssertFalse((fabricKey ?? "").isEmpty, "Fabric API key should not be empty")
        //XCTAssertNotNil(Fabric.sharedSDK(), "missing Fabric")

        //let crashlytics = Crashlytics.sharedInstance()
        //XCTAssertNotNil(crashlytics, "missing Crashlytics")
        //XCTAssertEqual(crashlytics.version, "3.7.1", "unexpected Crashlytics version")
        //XCTAssertEqual(crashlytics.apiKey, fabricKey, "unexpected Crashlytics APIKey")

        // ReportingAdapter wrappers

        //CLS_LOG_SWIFT("testFabricCrashlytics")
        //CLS_LOG_SWIFT("testFabricCrashlytics empty file", file: "")

        XCTAssertFalse(isUITesting(), "isUITesting() should be false")
        XCTAssert(isUnitTesting(), "isUnitTesting() should be true")
        XCTAssert(isTesting(), "isTesting() should be true")
    }

    /// SwiftyBeaver initialized ok
    func testSwiftyBeaver() {
        //XCTAssertTrue(log === SwiftyBeaver.self, "wrong SwiftyBeaver")

        let infoPlist = Bundle.main.infoDictionary
        let config = infoPlist?["SwiftyBeaver"] as? Dictionary<String, AnyObject>
        let appID = config?["AppID"] as? String
        XCTAssertFalse((appID ?? "").isEmpty, "SwiftyBeaver AppID should not be empty")
        let appSecret = config?["AppSecret"] as? String
        XCTAssertFalse((appSecret ?? "").isEmpty, "SwiftyBeaver AppSecret should not be empty")
        let encryptionKey = config?["EncryptionKey"] as? String
        XCTAssertFalse((encryptionKey ?? "").isEmpty, "SwiftyBeaver EncryptionKey should not be empty")
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
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
}
