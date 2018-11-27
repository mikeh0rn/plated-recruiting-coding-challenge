//
//  RecipeViewModel.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class RecipeViewModel {
    
    private var recipe = Recipe()
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    init(){
    }
    
    var id: Int? {
        if let recipeId = recipe.id {
            return recipeId
        }
        return 0
    }
    
    var name: String? {
        if let recipeTitle = recipe.name {
            return recipeTitle
        }
        return ""
    }
    
    var description: String? {
        if let recipeDescription = recipe.description {
            return recipeDescription
        }
        return ""
    }
    
    var image: String? {
        if let recipeImage = recipe.image {
            return recipeImage
        }
        return ""
    }
    
}
