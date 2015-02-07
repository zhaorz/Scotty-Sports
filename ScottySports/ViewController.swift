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



class ViewController: UIViewController, FBLoginViewDelegate, UIPickerViewDelegate{

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


   //CREATE NEW GAME
    sports = ["football", "soccer", "basektball", "frisbee", "squash", "running", "tennis", "baseball", "golf"]
    
    
    
    
    
    // Facebook methods


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Facebook login
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]

    }

    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
        performSegueWithIdentifier("loginSegue", sender: self)
        println("This is where you perform a segue.")

    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser){
        println("User Name: \(user.name)")
        //println("User Link: \(user.link)")
        storeUserDataOnServer(user.link)
    }
    
    func getIDFromURL(userURL: String) -> String {
        let count = countElements(userURL)
        var returnString: String = ""
        var slashCount = 0
        var newIndex: String.Index
        for index in 0..<count {
            newIndex = advance(userURL.startIndex, index)
            if String(userURL[newIndex]) == "/" {
                slashCount += 1
            }
            if slashCount == 4 {
                returnString = userURL.substringFromIndex(newIndex)
                break
            }
        }
        println(returnString)
        return returnString
    }
    
    func findGames(sport: String) -> [String] {
    //return list of gameIDs with selected sport
        var gameIDList: [String] = []
        var gameQuery = PFQuery(className: "games")
        var tester: String
        var dictionary: [String:String]
        return gameIDList
    }
    
    
    func createAGame(sport: String, location: String, time: String, numberOfPlayers: Int) -> Void {
        var newGame = PFObject(className: "games")
        newGame["sport"] = sport
        newGame["location"] = location
        newGame["time"] = time
        newGame["numberOfPlayers"] = numberOfPlayers
        newGame.saveInBackgroundWithTarget(nil, selector: nil)
    }
    
    func storeUserDataOnServer(userURL : String) {
        let userID = getIDFromURL(userURL)
        var query = PFQuery(className:"users")
        query.getObjectInBackgroundWithId("yEBwUTeJD1") {
            (gameScore: PFObject!, error: NSError!) -> Void in
            if error != nil {
                NSLog("%@", error)
            } else {
                gameScore["usernames"] = userID
                for key in gameScore.dictionaryWithValuesForKeys(["usernames"]) {
                    println(key.0)
                }
                gameScore.saveInBackgroundWithTarget(nil, selector: nil)
            }
        }
        //findGames("Basketball")
        //createAGame("Basketball",location: "Wiegand",time: "20:30",numberOfPlayers: 5)
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

