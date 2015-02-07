//
//  Player.swift
//  Ratings
//
//  Created by Caroline on 15/09/2014.
//  Copyright (c) 2014 Caroline. All rights reserved.
//

import Foundation


import UIKit

class Game: NSObject {
    var sport:String
    var location:String
    var numCurrent:String
    var numMax:String
    
  
    init(sport:String, location:String, numCurrent:String, numMax:String) {
        self.sport = sport
        self.location = location
        self.numCurrent = numCurrent
        self.numMax = numMax
        super.init()
    }
}