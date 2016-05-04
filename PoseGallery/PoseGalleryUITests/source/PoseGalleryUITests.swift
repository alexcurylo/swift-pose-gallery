//
//  PoseGalleryUITests.swift
//  PoseGalleryUITests
//
//  Copyright © 2016 Trollwerks Inc. All rights reserved.
//

import XCTest

class PoseGalleryUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        let app = XCUIApplication()
        app.launchArguments = ["UI_TESTING_MODE"]
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTabNavigation() {
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        let first = tabBarsQuery.buttons["First"]
        let second = tabBarsQuery.buttons["Second"]
        
        XCTAssert(first.selected == true)
        
        second.tap()
        
        // TODO: Need to delay properly? http://www.mokacoding.com/blog/xcode-ui-test-view-changes/
        sleep(2)

        XCTAssert(second.selected == true)

        first.tap()
        XCTAssert(first.selected == true)
    }
}
