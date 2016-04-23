//
//  CLS_LOG_SWIFT Created by Dima Vartanian on 3/6/15.
//
//  https://gist.github.com/DimaVartanian/a8aa73ba814a61f749c0//
//

import Foundation
import Fabric
import Crashlytics
import XCGLogger
//import Mixpanel

// Analytics singleton -- Alex's token!
//public let mixpanel = Mixpanel(token: "f92302f6975b0dcd77ee32db93cf778e")

/// Logging singleton
public let log = XCGLogger.defaultInstance()

/**
this method gives us pretty much the same functionality as the CLS_LOG macro, but written as a Swift function, the only differences are that we have to use array syntax for the argument list and that we don't get see if the method being called is a class method or an instance method. We also have to define the DEBUG compiler flag with -DDEBUG.

usage:
CLS_LOG_SWIFT()
CLS_LOG_SWIFT("message!")
CLS_LOG_SWIFT("message with parameter 1: %@ and 2: %@", ["First", "Second"])

CLS_LOG() output: -[ClassName methodName:] line 10 $
CLS_LOG_SWIFT() output: ClassName.methodName line 10 $

:param: format   message
:param: args     array of arguments to 'message'
:param: file     calling file
:param: function calling function
:param: line     calling line
*/
func CLS_LOG_SWIFT( _ format: String = "", _ args:[CVarArgType] = [], file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__)
{
    #if DEBUG
        CLSNSLogv("\(file.lastPathComponent.stringByDeletingPathExtension).\(function) line \(line) $ \(format)", getVaList(args))
    #else
        CLSLogv("\(file.lastPathComponent.stringByDeletingPathExtension).\(function) line \(line) $ \(format)", getVaList(args))
    #endif
    
}

/**
centralize crash/log/analytics setup
*/
public func startReporting() {
    // crashes
    //Fabric.with([Crashlytics.sharedInstance()])
    Fabric.with([Crashlytics()])
    // logging
    log.setup(logLevel: .Debug, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil)
    // analytics
    setupScreenTracking()
    // TO DO: Turn on when ready for beta
    //mixpanel.enabled = false; // remove when ready to start producing data
    //mixpanel.track("Launch")
}

/**
centralize Crashlytics dependencies -- crashing
*/
func crash() {
    Crashlytics.sharedInstance().crash()
}