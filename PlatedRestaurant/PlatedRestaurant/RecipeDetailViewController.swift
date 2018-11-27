//
//  RecipeDetailViewController.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    var apiManager = APIManager.sharedInstance
    var recipeId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiManager.recipe(recipeId: recipeId, completion: { result in
            self.recipeNameLabel.text = result.name
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
