//
//  CLS_LOG_SWIFT Created by Dima Vartanian on 3/6/15.
//
//  https://gist.github.com/DimaVartanian/a8aa73ba814a61f749c0//
//

import Foundation
/* awaiting Swift 3 / Xcode 8 compatibility
import ScreamingParty
import Fabric
import Crashlytics
import SwiftyBeaver

/// Logging singleton
let log = SwiftyBeaver.self

extension SwiftyBeaver {
    /// Think we'll adopt "scream" as a convention for ScreamingParty supplied setuppers
    static func scream() {
        // http://docs.swiftybeaver.com/article/9-log-to-xcode-console
        let console = ConsoleDestination()  // log to Xcode Console
        log.addDestination(console)

        // http://docs.swiftybeaver.com/article/10-log-to-file
        //let file = FileDestination()  // log to default swiftybeaver.log file
        //log.addDestination(file)

        // !!!: Put these in library
        let infoPlist = NSBundle.mainBundle().infoDictionary
        let config = infoPlist?["SwiftyBeaver"] as? Dictionary<String, AnyObject>
        let appID = config?["AppID"] as? String
        let appSecret = config?["AppSecret"] as? String
        let encryptionKey = config?["EncryptionKey"] as? String

        // http://docs.swiftybeaver.com/article/11-log-to-swiftybeaver-platform
        if let appID = appID, appSecret = appSecret, encryptionKey = encryptionKey {
            let platform = SBPlatformDestination(
                appID: appID,
                appSecret: appSecret,
                encryptionKey: encryptionKey)
            log.addDestination(platform)
        }

        // !!!: set up Crashlytics logging, see

        /*
        $0.setup(.Debug, showThreadName: true, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil, fileLogLevel: .Debug)

        let dateFormatter = NSDateFormatter().then {
            $0.dateFormat = "MM/dd/yyyy hh:mma"
            $0.locale = NSLocale.currentLocale()
        }
        $0.dateFormatter = dateFormatter

        $0.addLogDestination(CrashlyticsDestination(owner: $0, identifier: "Crashlytics"))
         */
    }
}
 */

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
/*
func CLS_LOG_SWIFT(format: String = "", _ args: [CVarArg] = [], file: String = #file, function: String = #function, line: Int = #line) {
    let filename = NSURL(string:file)?.lastPathComponent?.components(separatedBy: ".").first ?? ""

    #if DEBUG
        CLSNSLogv("\(filename).\(function) line \(line) $ \(format)", getVaList(args))
    #else
        CLSLogv("\(filename).\(function) line \(line) $ \(format)", getVaList(args))
    #endif
}
*/

/**
 Log destination for XCGLogger
 */
/*
class CrashlyticsDestination: XCGBaseLogDestination {

    /**
     XCGLogger extension for Crashlytics logging

     - parameter logDetails: As per the owner's log() call
     - parameter text:       As logged in Xcode, ie "06/05/2016 07:19AM [Info] [ReportingAdapters.swift:90] startReporting() > Reporting started"
     */
    override func output(logDetails: XCGLogDetails, text: String) {
        CLS_LOG_SWIFT(logDetails.logMessage, file: logDetails.fileName, function: logDetails.fileName, line: logDetails.lineNumber)
    }
}
 */

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

    // https://docs.fabric.io/ios/crashlytics/logged-errors.html
    // "In addition to automatically reporting your app’s crashes, Crashlytics lets you log NSError objects..."

    //Fabric.sharedSDK().debug = true
    //Fabric.with([Crashlytics.self])

    // SwiftyBeaver logging setup
/*
    log.scream()
    log.verbose("Reporting started")
*/
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
    let isUITesting = ProcessInfo.processInfo.arguments.contains("UI_TESTING_MODE")
    return isUITesting
}

func isTesting() -> Bool {
    return isUITesting() || isUnitTesting()
}
