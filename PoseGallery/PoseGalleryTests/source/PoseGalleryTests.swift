//
//  PoseGalleryTests.swift
//  PoseGalleryTests
//
//  Created by alex on 2014-11-27.
//  Copyright (c) 2014 Trollwerks Inc. All rights reserved.
//

import UIKit
import XCTest

class PoseGalleryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        let delegate = UIApplication.sharedApplication().delegate
        XCTAssertNotNil(delegate, "Delegate exists")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
