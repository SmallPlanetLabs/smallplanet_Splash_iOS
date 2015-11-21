//
//  ViewController.swift
//  Splash
//
//  Created by Quinn McHenry on 11/20/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

import UIKit
import Saturn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.readFromFile(String(bundlePath: "bundle://splash.xml"), intoParent: view)
    }


}

