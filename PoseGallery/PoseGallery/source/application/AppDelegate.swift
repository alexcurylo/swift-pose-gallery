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

    // MARK: - Life cycle methods

    /// UIApplicationDelegate implementation
    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        R.assertValid()

        startReporting()

        DataModel.model.intro(launchOptions)

        return true
    }

    /// UIApplicationDelegate implementation
    public func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    /// UIApplicationDelegate implementation
    public func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        DataModel.model.outro()
    }

    /// UIApplicationDelegate implementation
    public func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        DataModel.model.reintro()
    }

    /// UIApplicationDelegate implementation
    public func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    /// UIApplicationDelegate implementation
    public func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        DataModel.model.outro()
   }

}
