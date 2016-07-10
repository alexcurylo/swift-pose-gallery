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
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    /// Root window
    var window: UIWindow?

    // MARK: - UIApplicationDelegate implementations

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // not Swift 3 friendly
        //R.assertValid()

        startReporting()

        DataModel.model.intro(options: launchOptions)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        DataModel.model.outro()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        DataModel.model.reintro()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        print("INFO: \(self.dynamicType) applicationDidReceiveMemoryWarning")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        DataModel.model.outro()
   }
}
