//
//  PlayersViewController.swift
//  Ratings
//
//  Created by Caroline on 15/09/2014.
//  Copyright (c) 2014 Caroline. All rights reserved.
//

import UIKit

class GamesViewController: UITableViewController {

  var games:[Game] = gamesData
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return games.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath) as GameCell
    
    let game = games[indexPath.row] as Game
    cell.sportLabel.text = game.sport
    cell.locationLabel.text = game.location
    cell.numCurrentLabel.text = game.numCurrent
    cell.numMaxLabel.text = game.numMax
    return cell
  }
}
