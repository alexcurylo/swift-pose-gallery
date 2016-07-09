/*
 Then.swift

 Source:
    https://github.com/devxoul/Then v1.0.3

 References:
    http://khanlou.com/2016/06/configuration-in-swift/
 */

// The MIT License (MIT)
//
// Copyright (c) 2015 Suyeol Jeon (xoul.kr)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

public protocol Then {}

extension Then where Self: Any {

    /**
     Makes it available to set properties with closures just after initializing.

          let label = UILabel().then {
              $0.textAlignment = .Center
              $0.textColor = UIColor.blackColor()
              $0.text = "Hello, World!"
          }

     - parameter block: Closure operating on Self

     - returns: Self
     */
    public func then(block: @noescape (inout Self) -> Void) -> Self {
        var copy = self
        block(&copy)
        return copy
    }

}
/* 'Type of expression is ambiguous without more context' in Swift 3???
extension Then where Self: AnyObject {

    /**
     Makes it available to set properties with closures just after initializing.

         let label = UILabel().then {
             $0.textAlignment = .Center
             $0.textColor = UIColor.blackColor()
             $0.text = "Hello, World!"
         }

     - parameter block: Closure operating on Self

     - returns: Self
     */
    public func then(block: @noescape (Self) -> Void) -> Self {
        block(self)
        return self
    }
}
*/
extension NSObject: Then {}
