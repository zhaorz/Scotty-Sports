//
//  PlayerCell.swift
//  Ratings
//
//  Created by Caroline on 15/09/2014.
//  Copyright (c) 2014 Caroline. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {

  @IBOutlet weak var sportLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
