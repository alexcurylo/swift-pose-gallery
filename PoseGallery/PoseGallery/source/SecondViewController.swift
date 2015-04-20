//
// SecondViewController.swift
// PoseGallery
//
// Copyright (c) 2015 Trollwerks Inc. All rights reserved.
//

import UIKit

public class SecondViewController: UIViewController {

    /*override init (nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        println("inited controller")
    }
    override init (coder: NSCoder) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        println("inited controller")
    }*/

    deinit {
        println("deinited controller")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

