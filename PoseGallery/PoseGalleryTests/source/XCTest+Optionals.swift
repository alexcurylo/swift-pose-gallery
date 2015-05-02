//
//  XCTest+Optionals.swift
//  MdCalc
//
//  Created by alex on 2015-05-01.
//  Copyright (c) 2015 Assembly Co. All rights reserved.
//

import Foundation
import XCTest

/**
XCTAssertEqual that handles optional unwrapping.
https://gist.github.com/mprudhom/d1571213385725fd5ed8

:param: a       optional to test
:param: message error message
:param: file    file of assert
:param: line    line of assert
*/
func XCTAssertEqualOptional<T: Any where T: Equatable>(@autoclosure a: () -> T?, @autoclosure b: () -> T?, _ message: String? = nil, file: String = __FILE__, line: UInt = __LINE__) {
    if let _a = a() {
        if let _b = b() {
            XCTAssertEqual(_a, _b, (message != nil ? message! : ""), file: file, line: line)
        } else {
            XCTFail((message != nil ? message! : "a != nil, b == nil"), file: file, line: line)
        }
    } else if let _b = b() {
        XCTFail((message != nil ? message! : "a == nil, b != nil"), file: file, line: line)
    }
}

/**
Assert an optional is not nil
http://kimmett.me/2015/02/16/xctassertnotniloptional.html

:param: expression optional to test
:param: message error message
:param: file    file of assert
:param: line    line of assert
*/
func XCTAssertNotNilOptional<T>(@autoclosure expression:  () -> T?, message: String, file: String = __FILE__, line: UInt = __LINE__) {
    let optional = expression()
    let isNonNil = optional != nil
    XCTAssertTrue(isNonNil, message, file: file, line: line)
}

/**
Assert an optional is nil
http://kimmett.me/2015/02/16/xctassertnotniloptional.html

:param: expression optional to test
:param: message error message
:param: file    file of assert
:param: line    line of assert
*/
func XCTAssertNilOptional<T>(@autoclosure expression:  () -> T?, message: String, file: String = __FILE__, line: UInt = __LINE__) {
    let optional = expression()
    let isNil = optional == nil
    XCTAssertTrue(isNil, message, file: file, line: line)
}

