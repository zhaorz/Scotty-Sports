//
//  ViewController.swift
//  ScottySports
//
//  Eric Lee
//  Christina Yuan
//  Kevin Yang
//  Richard Zhao
//
//  Copyright (c) 2015 KIRK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
@IBAction func switcher(sender: AnyObject) {
    var object1 = PFObject(className: "users")
    object1.addObject("Soccer", forKey: "ayy")
    object1.saveInBackgroundWithTarget(nil , selector: nil)

}
    @IBAction func Soccer(sender: AnyObject) {
        var object1 = PFObject(className: "users")
        object1.addObject("usernameHere", forKey: "Sports")
    object1.saveInBackgroundWithTarget(nil , selector: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

