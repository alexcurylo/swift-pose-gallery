//
//  DataModel.swift
//  Rankzoo
//
//  Created by alex on 2015-05-11.
//  Copyright (c) 2015 Assembly Co. All rights reserved.
//

import CoreData
import UIKit
import Alamofire
import Signals
import JSQCoreDataKit
import SwiftyJSON
import XCGLogger

/// Encapsulate our data model
struct DataModel {
    
    // MARK: - Properties

    /// Singleton access
    static var model = DataModel()
    
    /// Vine connection status
    var connectedVine = false {
        willSet
        {
        }
        didSet
        {
            if connectedVine != oldValue
            {
                self.onConnectedChange.fire(connectedVine)
            }
        }
    }
    /// Signal connection change
    let onConnectedChange = Signal<Bool>()

    /// Rankzoo signed in status
    var signedInRankzoo = false {
        willSet
        {
        }
        didSet
        {
            if signedInRankzoo != oldValue
            {
                self.connectedVine = false
                self.onSignedInChange.fire(signedInRankzoo)
            }
        }
    }
    /// Signal signed in change
    let onSignedInChange = Signal<Bool>()
    
    /// onboarded
    var onboarded = false {
        willSet
        {
        }
        didSet
        {
            if onboarded != oldValue
            {
                self.onOnboardedChange.fire(onboarded)
            }
        }
    }
    /// Signal connection change
    let onOnboardedChange = Signal<Bool>()

    /// Core Data stack
    var stack: CoreDataStack = {
        let model = CoreDataModel(name: "Rankzoo")
        
        // for while we're messing with data model
        NSFileManager.defaultManager().removeItemAtURL(model.storeURL, error: nil)
        
        let stack = CoreDataStack(model: model)
        //log.info(stack.description)
        return stack
        }()
    
    /// Currently loading user data
    var loadingUsers = false
    /// Current page of user data being loaded
    var currentUsersPage = 0

    /// Currently loading post data
    var loadingPosts = false
    /// Current page of rank data being loaded
    var currentPostsPage = 0

    // MARK: - Life cycle methods

    /// Reflect last saved state
    init() {
        onboarded = false
        connectedVine = false
        signedInRankzoo = false
    }

    // MARK: - Exposed functionality

    /**
    Copy build parameters to Settings display via NSUserDefaults
    
    :param: launchOptions as passed to didFinishLaunchingWithOptions
    
    :returns: Whether bundle has all expected fields
    */
    func configureSettingsApp() {
        // Info.plist configured with build scripts
        if let bundle = NSBundle.mainBundle() as NSBundle?,
            let display_name = bundle.objectForInfoDictionaryKey("CFBundleDisplayName") as? String where !display_name.isEmpty,
            let version_number = bundle.objectForInfoDictionaryKey("CFBundleShortVersionString") as? String where !version_number.isEmpty,
            let build_number = bundle.objectForInfoDictionaryKey("CFBundleVersion") as? String where !build_number.isEmpty,
            let build_date = bundle.objectForInfoDictionaryKey("CFBuildDate") as? String where !build_date.isEmpty,
            let build_config = bundle.objectForInfoDictionaryKey("CFBuildConfiguration") as? String where !build_config.isEmpty
        {
            // copy to keys specified in Settings.bundle
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(version_number, forKey:"version_number")
            defaults.setObject(build_number, forKey:"build_number")
            defaults.setObject(build_date, forKey:"build_date")
            defaults.synchronize()
        }
    }
    
    /// write data out to disk
    func save() {
        stack.save()
    }
    
    // TODO: Implement paging, profile, stats, posts?

    /// reload Users from scratch
    mutating func refreshUsers() {
        if (!loadingUsers) {
            currentUsersPage = 0
            loadNextPageUsers()
        }
    }
    
    /// load next Users page
    mutating func loadNextPageUsers() {
        currentUsersPage += 1
        loadingUsers = true
        Alamofire.request(RankzooAPI.Router.Users(RankzooAPI.UsersInterval(),  RankzooAPI.UsersOrder(), currentUsersPage, 50)).validate().responseSwiftyJSON {
            (request, response, json, error) in
            self.loadingUsers = false
            if let error = error  {
                log.error("Error: \(error)")
                log.error(request.description)
                log.error(response?.description)
            }
            else {
                log.info("Success: \(request)")
                log.info("\(json.count) items: \(json)")
                
                let childContext = self.stack.childManagedObjectContext()
                if self.currentUsersPage == 1 {
                    let result = User.fetchUsers(childContext)
                    deleteObjects(result.objects, inContext: childContext)
                    log.info("\(result.objects.count) deleted!")
                }
                User.createUsers(childContext, items:json)
                childContext.save()
                self.save()
            }
        }
    }

    /// reload Posts from scratch
    mutating func refreshPosts() {
        if (!loadingPosts) {
            currentPostsPage = 0
            loadNextPagePosts()
        }
    }
    
    /// load next Posts page
    mutating func loadNextPagePosts() {
        currentPostsPage += 1
        loadingPosts = true
        Alamofire.request(RankzooAPI.Router.Posts(RankzooAPI.PostsInterval(),  RankzooAPI.PostsOrder(), currentPostsPage, 50)).validate().responseSwiftyJSON {
            (request, response, json, error) in
            self.loadingPosts = false
            if let error = error  {
                log.error("Error: \(error)")
                log.error(request.description)
                log.error(response?.description)
            }
            else {
                log.info("Success: \(request)")
                log.info("\(json.count) items: \(json)")
                /*
                let childContext = self.stack.childManagedObjectContext()
                if self.currentPostsPage == 1 {
                    let result = User.fetchPosts(childContext)
                    deleteObjects(result.objects, inContext: childContext)
                    log.info("\(result.objects.count) deleted!")
                }
                User.createPosts(childContext, items:json)
                childContext.save()
                self.save()
                */
            }
        }
    }

    /// load user profile
    func loadProfile(userID: Int) {
        Alamofire.request(RankzooAPI.Router.Profile(userID)).validate().responseSwiftyJSON {
            (request, response, json, error) in
            if let error = error  {
                log.error("Error: \(error)")
                log.error(request.description)
                log.error(response?.description)
            }
            else {
                log.info("Success: \(request)")
                log.info("Profile: \(json)")
                
                /*
                let childContext = self.stack.childManagedObjectContext()
                if self.currentUsersPage == 1 {
                    let result = User.fetchUsers(childContext)
                    deleteObjects(result.objects, inContext: childContext)
                    log.info("\(result.objects.count) deleted!")
                }
                User.createUsers(childContext, items:json)
                childContext.save()
                self.save()
                */
            }
        }
    }
    
    /// load user stats
    func loadStats(userID: Int) {
        Alamofire.request(RankzooAPI.Router.Stats(userID, RankzooAPI.StatsInterval())).validate().responseSwiftyJSON {
            (request, response, json, error) in
            if let error = error  {
                log.error("Error: \(error)")
                log.error(request.description)
                log.error(response?.description)
            }
            else {
                log.info("Success: \(request)")
                log.info("Profile: \(json)")
                
                /*
                let childContext = self.stack.childManagedObjectContext()
                if self.currentUsersPage == 1 {
                let result = User.fetchUsers(childContext)
                deleteObjects(result.objects, inContext: childContext)
                log.info("\(result.objects.count) deleted!")
                }
                User.createUsers(childContext, items:json)
                childContext.save()
                self.save()
                */
            }
        }
    }
}
