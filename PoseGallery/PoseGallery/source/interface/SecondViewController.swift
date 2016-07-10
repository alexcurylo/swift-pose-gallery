//
// SecondViewController.swift
// PoseGallery
//
// Copyright © 2016 Trollwerks Inc. All rights reserved.
//

import UIKit
import Crashlytics

/**
Second tab
*/
final class SecondViewController: UIViewController {

    /// UIViewController overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //Answers.logContentView(withName: "\(self.dynamicType)", contentType: nil, contentId: nil, customAttributes: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        print("INFO: \(self.dynamicType) didReceiveMemoryWarning")

        super.didReceiveMemoryWarning()
    }
}
