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
        if let button = splashView?.objectsWithId("shareButton").first as? UIButton {
            button.addTarget(self, action: Selector("presentShare"), forControlEvents: .TouchUpInside)
        }
    }

    var systemVersion: String {
        let os = NSProcessInfo().operatingSystemVersion
        return "\(os.majorVersion).\(os.minorVersion).\(os.patchVersion)"
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // MARK: - Screenshot
    
    var screenshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0)
        view.drawViewHierarchyInRect(CGRect(origin: CGPointZero, size: view.frame.size), afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func presentShare() {
        guard let image = screenshot else { return }
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        if UI_USER_INTERFACE_IDIOM() == .Phone {
            presentViewController(activityVC, animated: true, completion: nil)
        } else {
            // Present the view controller using the popover style.
            activityVC.modalPresentationStyle = .Popover;
            presentViewController(activityVC, animated: true, completion: nil)
            
            // Get the popover presentation controller and configure it.
            let presentationController = activityVC.popoverPresentationController
            presentationController?.permittedArrowDirections = [.Any]
            presentationController?.sourceView = view
            presentationController?.sourceRect = CGRect(x: view.frame.size.width * 0.5, y: view.frame.size.height * 0.5, width: 1, height: 1)
        }
        
    }
}

