//
//  RestaurantCell.swift
//  PorVidaMobile
//
//  Created by cory on 4/13/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {
    @IBOutlet weak var restaurant: UILabel!
    @IBOutlet weak var location: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
