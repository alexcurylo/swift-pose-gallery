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
        let model = CoreDataModel(name: "Rankzoo")

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
    func intro(options: [NSObject: AnyObject]?) {
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
        if let display_name = Bundle.main.objectForInfoDictionaryKey("CFBundleDisplayName") as? String where !display_name.isEmpty,
            let version_number = Bundle.main.objectForInfoDictionaryKey("CFBundleShortVersionString") as? String where !version_number.isEmpty,
            let build_number = Bundle.main.objectForInfoDictionaryKey("CFBundleVersion") as? String where !build_number.isEmpty,
            let build_date = Bundle.main.objectForInfoDictionaryKey("CFBuildDate") as? String where !build_date.isEmpty,
            let build_config = Bundle.main.objectForInfoDictionaryKey("CFBuildConfiguration") as? String where !build_config.isEmpty {
            // copy to keys specified in Settings.bundle
            let defaults = UserDefaults.standard
            defaults.set(version_number, forKey:"version_number")
            defaults.set(build_number, forKey:"build_number")
            defaults.set(build_date, forKey:"build_date")
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
