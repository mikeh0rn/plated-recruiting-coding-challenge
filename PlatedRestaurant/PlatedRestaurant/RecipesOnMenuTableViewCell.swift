//
//  RecipesOnMenuTableViewCell.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import UIKit

class RecipesOnMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeDescription: UILabel!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
