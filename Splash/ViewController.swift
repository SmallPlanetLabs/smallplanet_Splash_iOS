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
        
        let splashView = UIView.readFromFile(String(bundlePath: "bundle://splash.xml"), intoParent: view)
        
        if let version = splashView?.objectsWithId("version").first as? UILabel {
            version.text = systemVersion
        }
        
        if let hardware = splashView?.objectsWithId("hardware").first as? UILabel {
            hardware.text = hardwareDescription()
        }
    }

    var systemVersion: String {
        let os = NSProcessInfo().operatingSystemVersion
        return "\(os.majorVersion).\(os.minorVersion).\(os.patchVersion)"
    }

}

