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
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    /// Root window
    var window: UIWindow?

    // MARK: - UIApplicationDelegate implementations

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        R.assertValid()

        startReporting()

        DataModel.model.intro(launchOptions)

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
        DataModel.model.outro()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        DataModel.model.reintro()
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationDidReceiveMemoryWarning(application: UIApplication) {
        print("INFO: \(self.dynamicType) applicationDidReceiveMemoryWarning")
    }

    func applicationWillTerminate(application: UIApplication) {
        DataModel.model.outro()
   }
}
