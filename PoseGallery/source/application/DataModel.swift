//
// DataModel.swift
// PoseGallery
//
// Copyright © 2016 Trollwerks Inc. All rights reserved.
//

//import CoreData
import UIKit
//import Alamofire
//import Signals
//import JSQCoreDataKit
//import SwiftyJSON

/// Encapsulate our data model
final class DataModel {

    // MARK: - Properties

    /// Singleton access
    static var model = DataModel()

/*
    /// Core Data stack
    var stack: CoreDataStack = {
        let model = CoreDataModel(name: "PoseGallery")

        // for while we're messing with data model
        NSFileManager.defaultManager().removeItemAtURL(model.storeURL, error: nil)

        let stack = CoreDataStack(model: model)
        //log.info(stack.description)
        return stack
        }()
    */

    // MARK: - Life cycle methods

    /// Reflect last saved state
    init() {
    }

    /**
     Kick off whatever actions should happen at startup

     - parameter options: from didFinishLaunchingWithOptions
     */
    func intro(options: [UIApplicationLaunchOptionsKey : Any]?) {
        //log.info("startup options: \(options)")
        configureSettingsApp()
    }

    /**
    Kick off whatever actions should happen coming from background
    */
    func reintro() {
    }

    /**
    Kick off whatever actions should happen at background/termination
    */
    func outro() {
        //save()
    }


    // MARK: - Exposed functionality

    /**
    Copy build parameters to Settings display via NSUserDefaults

    :param: launchOptions as passed to didFinishLaunchingWithOptions

    :returns: Whether bundle has all expected fields
    */
    func configureSettingsApp() {
        // Info.plist configured with build scripts
        if let displayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String, !displayName.isEmpty,
            let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String, !versionNumber.isEmpty,
            let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String, !buildNumber.isEmpty,
            let buildDate = Bundle.main.object(forInfoDictionaryKey: "CFBuildDate") as? String, !buildDate.isEmpty,
            let buildConfig = Bundle.main.object(forInfoDictionaryKey: "CFBuildConfiguration") as? String, !buildConfig.isEmpty {
            // copy to keys specified in Settings.bundle
            let defaults = UserDefaults.standard
            defaults.set(versionNumber, forKey:"version_number")
            defaults.set(buildNumber, forKey:"build_number")
            defaults.set(buildDate, forKey:"build_date")
            defaults.synchronize()
        }
    }

    /// write data out to disk
    /*
    func save() {
        stack.save()
    }
*/

}
