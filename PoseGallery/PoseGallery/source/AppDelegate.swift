//
// AppDelegate.swift
// PoseGallery
//
// Copyright (c) 2015 Trollwerks Inc. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics


/**
Singleton UIApplication delegate
*/
@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {

    /// Root window
    public var window: UIWindow?

    /// UIApplicationDelegate implementation
    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Fabric.with([Crashlytics()])

        configureSettingsApp(launchOptions)
        
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
    }

    /// UIApplicationDelegate implementation
    public func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    /// UIApplicationDelegate implementation
    public func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    /// UIApplicationDelegate implementation
    public func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    /**
    Copy build parameters to Settings display via NSUserDefaults
    
    :param: launchOptions as passed to didFinishLaunchingWithOptions
    
    :returns: Whether bundle has all expected fields
    */
    public func configureSettingsApp(launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Info.plist configured with build scripts
        let bundle = NSBundle.mainBundle()
        let display_name = bundle.objectForInfoDictionaryKey("CFBundleDisplayName") as! String
        let version_number = bundle.objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
        let build_number = bundle.objectForInfoDictionaryKey("CFBundleVersion") as! String
        let build_date = bundle.objectForInfoDictionaryKey("CFBuildDate") as! String
        if (display_name.isEmpty || version_number.isEmpty || build_number.isEmpty || build_date.isEmpty)
        {
            return false
        }

        // copy to keys specified in Settings.bundle
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(version_number, forKey:"version_number")
        defaults.setObject(build_number, forKey:"build_number")
        defaults.setObject(build_date, forKey:"build_date")
        defaults.synchronize();

        println("FYI: launched \(display_name) \(version_number)(\(build_number)) \(build_date) -- options: \(launchOptions)")

        return true
    }

}

