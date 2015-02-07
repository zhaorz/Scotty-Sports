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
//PAGE 1
    
    @IBOutlet weak var usernameInput: UITextField!
    
    @IBAction func submitUsername(sender: AnyObject) {
        var object1 = PFObject(className: "users")
        object1.addObject(usernameInput.text, forKey: "name")
        object1.saveInBackgroundWithTarget(nil , selector: nil)

    }
//PAGE 2

@IBAction func Running(sender: AnyObject) {
}
@IBAction func Tennis(sender: AnyObject) {
}
@IBAction func Baseball(sender: AnyObject) {
}
@IBAction func Squash(sender: AnyObject) {
    var object1 = PFObject(className: "users")
    object1.addObject("Squash", forKey: "ayy")
    object1.saveInBackgroundWithTarget(nil , selector: nil)
}
@IBAction func Frisbee(sender: AnyObject) {
    var object1 = PFObject(className: "users")
    object1.addObject("Frisbee", forKey: "ayy")
    object1.saveInBackgroundWithTarget(nil , selector: nil)
}
@IBAction func Basketball(sender: AnyObject) {
    var object1 = PFObject(className: "users")
    object1.addObject("Basketball", forKey: "ayy")
    object1.saveInBackgroundWithTarget(nil , selector: nil)
}
@IBAction func Football(sender: AnyObject) {
var object1 = PFObject(className: "users")
    object1.addObject("Football", forKey: "ayy")
    object1.saveInBackgroundWithTarget(nil , selector: nil)
}
    
@IBAction func switcher(sender: AnyObject) {
    var object1 = PFObject(className: "users")
    object1.addObject("Soccer", forKey: "ayy")
    object1.saveInBackgroundWithTarget(nil , selector: nil)

}

//PAGE 3


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

