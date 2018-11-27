//
//  Recipe.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class Recipe {

    var id: Int? = 0
    var name: String? = ""
    var description: String? = ""
    var image: String? = ""
    
    init(recipeJSON: JSON) {
        self.id = recipeJSON["id"].intValue
        self.name = recipeJSON["name"].stringValue
        self.description = recipeJSON["description"].stringValue
        self.image = recipeJSON["image"].stringValue
    }
    
    init() {
    }
    
}
