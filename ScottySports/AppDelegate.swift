//
//  AppDelegate.swift
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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Parse.setApplicationId("A7oc3dFefYXiqL1j3k31GdcUDujbrddA43Z4BKF9", clientKey: "pjY9FAF9HhoXc0iJwHfhlB9jwuCrp28SXZxAXlL6")
        
        //KYANGCOMMENT: below is syntax for adding a basic object
        
        var object = PFObject(className: "users")
        object.addObject("usernameHere", forKey: "usernames")
        object.saveInBackgroundWithTarget(nil , selector: nil)
        
        /*
        KYANGCOMMENT: below is syntax for getting the objectId right after saving
        Later, we want to store this id in NSUserDefaults (local storage)
        For now, if you want a specific id, look at our parse webpage
        
        var object1 = PFObject(className: "users")
        object.saveInBackgroundWithBlock { //lets us do something once it finishes background task
            (success: Bool, error: NSError!) -> Void in
            if (success) {
                let objectId = object.objectId
                println(objectId)
            }
            else {
                println("There was a problem updating") //hopefully this won't happen lol
            }
        }
        */
        

        
        // Override point for customization after application launch.
        
        // Facebook API
        FBLoginView.self
        FBProfilePictureView.self
        
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: NSString?, annotation: AnyObject) -> Bool {
        
        var wasHandled:Bool = FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication)
        return wasHandled
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

