//
//  MenuDetailCell.swift
//  PorVidaMobile
//
//  Created by Christian on 5/2/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit

class MenuDetailCell: UITableViewCell {

    @IBOutlet weak var menuType: UILabel!
    
    @IBOutlet weak var nutritionLabel: UILabel!
    @IBOutlet weak var menuDesciption: UILabel!
    @IBOutlet weak var menuItem: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
