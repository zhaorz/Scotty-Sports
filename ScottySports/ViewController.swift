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
import QuartzCore


class ViewController: UIViewController, FBLoginViewDelegate {

    // Facebook button object
    @IBOutlet var fbLoginView : FBLoginView!

//PAGE 2
    
    
        // Eric Page 2
    
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
    
    @IBAction func createNewGame(sender: AnyObject) {
        //CREATES A NEW GAME
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Facebook login
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]

    }
    
    // Facebook methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
        
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser){
        println("User Name: \(user.name)")
        println("link: \(user.link)")
        performSegueWithIdentifier("segue1-2", sender: self)
        
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

