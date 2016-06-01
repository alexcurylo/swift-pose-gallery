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
let log = XCGLogger.defaultInstance()

/**
this method gives us pretty much the same functionality as the CLS_LOG macro, but written as a Swift
 function, the only differences are that we have to use array syntax for the argument list and that
 we don't get see if the method being called is a class method or an instance method. We also have
 to define the DEBUG compiler flag with -DDEBUG.

 See https://docs.fabric.io/ios/crashlytics/enhanced-reports.html#custom-keys
     https://docs.fabric.io/ios/crashlytics/enhanced-reports.html#custom-logs

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
func startReporting() {
    // Fabric: crash reporting, distribution, analytics

    // Optionally set up delegate, user ID
    //CrashlyticsKit.delegate = self;
    //- (void)crashlyticsDidDetectReportForLastExecution:(CLSReport *)report completionHandler:(void (^)(BOOL submit))completionHandler;
    // Do we have any user-identifying information?
    //Crashlytics.sharedInstance().setUserEmail("user@fabric.io")
    //Crashlytics.sharedInstance().setUserIdentifier("12345")
    //Crashlytics.sharedInstance().setUserName("Test User")

    Fabric.sharedSDK().debug = true
    Fabric.with([Crashlytics.self])

    // set up Answers here

    // logging
    log.setup(.Debug, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil)
}

/**
 Runtime enviroment inquiries

 - returns: whether queried condition is true
 */
func isUnitTesting() -> Bool {
    let isUnitTesting = NSClassFromString("XCTestCase") != nil
    return isUnitTesting
}

func isUITesting() -> Bool {
    let isUITesting = NSProcessInfo.processInfo().arguments.contains("UI_TESTING_MODE")
    return isUITesting
}

func isTesting() -> Bool {
    return isUITesting() || isUnitTesting()
}
