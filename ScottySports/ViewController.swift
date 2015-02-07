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

let defaults = NSUserDefaults.standardUserDefaults()

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


   //CREATE NEW GAME
    //sports = ["football", "soccer", "basektball", "frisbee", "squash", "running", "tennis", "baseball", "golf"]
    
    
    
    
    
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
    
    func deleteFavoriteSport(userObjectId: String, sport: String) -> Void {
        var query = PFQuery(className: "games")
        query.getObjectInBackgroundWithId(userObjectId) {
            (userObject: PFObject!, error: NSError!) -> Void in
            if error == nil {
                var listOfSports = userObject["favoriteSports"] as NSArray
                var returnList = listOfSports as Array
                var count = 0
                for i in listOfSports {
                    if listOfSports[count] as NSString == sport {
                        returnList.removeAtIndex(count)
                    count += 1
                    }
                }
                userObject["favoriteSports"] = returnList
                userObject.saveInBackgroundWithTarget(nil, selector: nil)
                }
            }
        }
    
    func findGames(sport: String) -> [[String]] {
    //return list of gameIDs with selected sport
        var gameIDList: [[String]] = []
        var gameQuery = PFQuery(className: "games")
        var gameList: [String] = ["","","","","",""]
        for i in gameQuery.findObjects()
        {
            //println("The ith output is \(i)")
            println(i.objectId)
            println(i.objectForKey("sport") as NSString)
            if i.objectForKey("sport") as NSString == "Basketball" {
                gameList[0] = i.objectId
                gameList[1] = i.objectForKey("sport") as NSString
                gameList[2] = i.objectForKey("location") as NSString
                gameList[3] = i.objectForKey("time") as NSString
                gameList[4] = i.objectForKey("playerCount") as NSString
                gameList[5] = i.objectForKey("maxPlayers") as NSString
                gameIDList.append(gameList)
                println("added \(i.objectId)!")
            }
            
        }
        return gameIDList
    }
    
    
    func createAGame(sport: String, location: String, time: String, numberOfPlayers: Int) -> Void {
        var newGame = PFObject(className: "games")
        var userID = defaults.stringForKey("userID")
        //let userID = "/889558237733909/"
        var currentPlayersList: [String] = []
        currentPlayersList.append(userID as String!)
        newGame["currentPlayers"] = currentPlayersList
        newGame["sport"] = sport
        newGame["location"] = location
        newGame["time"] = time
        newGame["maxPlayers"] = numberOfPlayers
        newGame.saveInBackgroundWithTarget(nil, selector: nil)
    }
    
    func checkIfUserExists(userId: String) -> Bool {
        
        var query = PFQuery(className: "users")
        var stringTester: String = ""
        if let checkUserID = defaults.stringForKey("userID") {
            if let checkObjectID = defaults.stringForKey("userObjectID") {
                return true
        }
        }
        return false}
    
    func createUser(userId: String) -> Void {
        var newUser = PFObject(className: "users")
        var emptyStringList: [String] = []
        var emptyStringList2: [String] = []
        newUser["username"] = userId
        if let checkObjectID = defaults.stringForKey("userObjectID") {}
        else {defaults.setObject(newUser.objectId, forKey: "userObjectID")}
        newUser.saveInBackgroundWithTarget(nil, selector: nil)
    }
    
    func storeUserDataOnServer(userURL : String) {
        var doesUserExist = false
        let userID = getIDFromURL(userURL) as NSString
        if let storeUserID = defaults.stringForKey("userID") {}
        else {defaults.setObject(userID,forKey:"userID")}
        
        doesUserExist = checkIfUserExists(userID)
        if !doesUserExist {
            createUser(userID)
        }
        var query = PFQuery(className:"users")
        let userObjectID = defaults.stringForKey("userObjectID")
        //let userObjectID = "yEBwUTeJD1"
        query.getObjectInBackgroundWithId(userObjectID) {
            (gameScore: PFObject!, error: NSError!) -> Void in
            if error != nil {
                NSLog("%@", error)
            } else {
                gameScore["usernames"] = userID
                gameScore.saveInBackgroundWithTarget(nil, selector: nil)
            }
        }
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

