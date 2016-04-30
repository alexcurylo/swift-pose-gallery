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
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
