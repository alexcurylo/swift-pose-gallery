//
//  XCTest+Optionals.swift
//  PoseGallery
//
//  Copyright © 2016 Trollwerks Inc. All rights reserved.
//

import Foundation
import XCTest

/**
 XCTAssertEqual that handles optional unwrapping.
 https://gist.github.com/mprudhom/d1571213385725fd5ed8

 - parameter first:   optional to test
 - parameter second:  optional to test
 - parameter message: error message
 - parameter file:    file of assert
 - parameter line:    line of assert
 */
func XCTAssertEqualOptional<T: Any where T: Equatable>(@autoclosure a first: () -> T?, @autoclosure b second: () -> T?, _ message: String? = nil, file: StaticString = #file, line: UInt = #line) {
    if let _first = first() {
        if let _second = second() {
            XCTAssertEqual(_first, _second, (message != nil ? message! : ""), file: file, line: line)
        } else {
            XCTFail((message != nil ? message! : "first != nil, second == nil"), file: file, line: line)
        }
    } else if second() != nil {
        XCTFail((message != nil ? message! : "first == nil, second != nil"), file: file, line: line)
    }
}

/**
 Assert an optional is not nil
 http://kimmett.me/2015/02/16/xctassertnotniloptional.html

 - parameter expression: optional to test
 - parameter message:    error message
 - parameter file:       file of assert
 - parameter line:       line of assert
 */
func XCTAssertNotNilOptional<T>(@autoclosure expression:  () -> T?, message: String, file: StaticString = #file, line: UInt = #line) {
    let optional = expression()
    let isNonNil = optional != nil
    XCTAssertTrue(isNonNil, message, file: file, line: line)
}

/**
 Assert an optional is nil
 http://kimmett.me/2015/02/16/xctassertnotniloptional.html

 - parameter expression: optional to test
 - parameter message:    error message
 - parameter file:       file of assert
 - parameter line:       line of assert
 */
func XCTAssertNilOptional<T>(@autoclosure expression:  () -> T?, message: String, file: StaticString = #file, line: UInt = #line) {
    let optional = expression()
    let isNil = optional == nil
    XCTAssertTrue(isNil, message, file: file, line: line)
}
