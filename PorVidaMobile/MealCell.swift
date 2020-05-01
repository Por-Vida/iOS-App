//
//  MealCell.swift
//  PorVidaMobile
//
//  Created by cory on 4/30/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
