//
// FirstViewController.swift
// PoseGallery
//
// Copyright © 2016 Trollwerks Inc. All rights reserved.
//

import UIKit
import Crashlytics

/**
    First tab
*/
final class FirstViewController: UIViewController {

    /// UIViewController override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //Answers.logContentView(withName: "\(self.dynamicType)", contentType: nil, contentId: nil, customAttributes: nil)
    }

    /// UIViewController override
    override func didReceiveMemoryWarning() {
        print("INFO: \(type(of: self)) didReceiveMemoryWarning")

        super.didReceiveMemoryWarning()
    }
}
