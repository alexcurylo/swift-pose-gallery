//
// ScreenTracking.swift
//
// Created by Alek Åström on 2015-02-14.
// Copyright (c) 2015 Alek Åström. (https://github.com/MrAlek)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import Swiftalytics

/**
Associate an identifier with all tracked screens
*/
func setupScreenTracking() {

#if TESTING
    // no tracking
#else
    FirstViewController.self  >>   "FirstViewController (start)"
    SecondViewController.self  >>   .NavigationTitle
    //QuoteViewController.self    >> { "Quote: "+$0.author.name }
    //RandomQuoteViewController.computedPageName<<
#endif
}

/**
Adorn viewDidAppear with screen tracking
*/
extension UIViewController {
    
    ///swizzle viewDidAppear to add screen tracking
    public override class func initialize() {
        /// wrap associated variables in structure
        struct Static {
            /// only swizzle once
            static var token: dispatch_once_t = 0
        }
        
        // make sure this isn't a subclass
        if self !== UIViewController.self {
            return
        }
        
        dispatch_once(&Static.token) {
            let originalSelector = #selector(UIViewController.viewDidAppear(_:))
            let swizzledSelector = #selector(UIViewController.swiftalytics_viewDidAppear(_:))
            
            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            
            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
            
            if didAddMethod {
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    }
    
    // MARK: - Method Swizzling
    
    /// track screen if set up
    func swiftalytics_viewDidAppear(animated: Bool) {
        self.swiftalytics_viewDidAppear(animated)
        if let name = Swiftalytics.trackingNameForViewController(self) {
            // Report to your analytics service
            print("Tracked view controller: "+name)
        }
    }
}


postfix operator << { }
/// postfix operator to associate closure
private postfix func <<<T: UIViewController>(trackClassFunction: (T -> () -> String)) {
    Swiftalytics.setTrackingNameForViewController(trackClassFunction)
}
/// infix operator to associate closure
private func >> <T: UIViewController>(left: T.Type, @autoclosure right: () -> String) {
    Swiftalytics.setTrackingNameForViewController(left, name: right)
}
/// infix operator to associate type
private func >> <T: UIViewController>(left: T.Type, right: TrackingNameType) {
    Swiftalytics.setTrackingNameForViewController(left, trackingType: right)
}
/// infix operator to associate string
private func >> <T: UIViewController>(left: T.Type, right: (T -> String)) {
    Swiftalytics.setTrackingNameForViewController(left, nameFunction: right)
}
