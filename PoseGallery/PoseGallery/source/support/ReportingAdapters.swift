//
//  CLS_LOG_SWIFT Created by Dima Vartanian on 3/6/15.
//
//  https://gist.github.com/DimaVartanian/a8aa73ba814a61f749c0//
//

import Foundation
import Fabric
import Crashlytics
import XCGLogger

/// Logging singleton
public let log = XCGLogger.defaultInstance()

/**
this method gives us pretty much the same functionality as the CLS_LOG macro, but written as a Swift
 function, the only differences are that we have to use array syntax for the argument list and that
 we don't get see if the method being called is a class method or an instance method. We also have
 to define the DEBUG compiler flag with -DDEBUG.

usage:
CLS_LOG_SWIFT()
CLS_LOG_SWIFT("message!")
CLS_LOG_SWIFT("message with parameter 1: %@ and 2: %@", ["First", "Second"])

CLS_LOG() output: -[ClassName methodName:] line 10 $
CLS_LOG_SWIFT() output: ClassName.methodName line 10 $

 - parameter format:   message
 - parameter args:     array of arguments to 'message'
 - parameter file:     calling file
 - parameter function: calling function
 - parameter line:     calling line
*/
func CLS_LOG_SWIFT(format: String = "", _ args: [CVarArgType] = [], file: String = #file, function: String = #function, line: Int = #line) {
    let filename = NSURL(string:file)?.lastPathComponent?.componentsSeparatedByString(".").first ?? ""

    #if DEBUG
        CLSNSLogv("\(filename).\(function) line \(line) $ \(format)", getVaList(args))
    #else
        CLSLogv("\(filename).\(function) line \(line) $ \(format)", getVaList(args))
    #endif
}

/**
centralize crash/log/analytics setup
*/
public func startReporting() {
    // Fabric: crash reporting, distribution, analytics
    // !!!: This crashes?
    //Fabric.with([Crashlytics.self])

    // logging
    log.setup(.Debug, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil)
}

/**
centralize Crashlytics dependencies -- crashing
*/
func crash() {
    Crashlytics.sharedInstance().crash()
}
