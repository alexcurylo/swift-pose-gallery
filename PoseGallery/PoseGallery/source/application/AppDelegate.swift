//
// AppDelegate.swift
// PoseGallery
//
// Copyright © 2016 Trollwerks Inc. All rights reserved.
//

import UIKit

/**
Singleton UIApplication delegate
*/
@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    /// Root window
    public var window: UIWindow?

    // MARK: - UIApplicationDelegate implementations

    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        R.assertValid()

        startReporting()

        DataModel.model.intro(launchOptions)

        return true
    }

    public func applicationWillResignActive(application: UIApplication) {
    }

    public func applicationDidEnterBackground(application: UIApplication) {
        DataModel.model.outro()
    }

    public func applicationWillEnterForeground(application: UIApplication) {
        DataModel.model.reintro()
    }

    public func applicationDidBecomeActive(application: UIApplication) {
    }

    public func applicationWillTerminate(application: UIApplication) {
        DataModel.model.outro()
   }
}
