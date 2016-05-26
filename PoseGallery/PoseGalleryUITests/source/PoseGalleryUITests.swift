//
//  PoseGalleryUITests.swift
//  PoseGalleryUITests
//
//  Copyright © 2016 Trollwerks Inc. All rights reserved.
//

import XCTest

final class PoseGalleryUITests: XCTestCase {

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

        let selectedPredicate = NSPredicate(format: "selected == true")
        expectationForPredicate(selectedPredicate, evaluatedWithObject: second, handler: nil)
        waitForExpectationsWithTimeout(5, handler: nil)

        first.tap()

        expectationForPredicate(selectedPredicate, evaluatedWithObject: first, handler: nil)
        waitForExpectationsWithTimeout(5, handler: nil)
    }
}
