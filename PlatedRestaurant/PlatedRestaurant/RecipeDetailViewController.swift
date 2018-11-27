//
//  RecipeDetailViewController.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import UIKit
import Kingfisher

class RecipeDetailViewController: UIViewController {
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeDescriptionLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var apiManager = APIManager.sharedInstance
    var recipeId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiManager.recipe(recipeId: recipeId, completion: { result in
            self.activityIndicator.startAnimating()
            self.recipeNameLabel.text = result.name
            self.recipeDescriptionLabel.text = result.description
            DispatchQueue.global(qos: .background).async {
                DispatchQueue.main.async {
                    let url = URL(string: (result.image)!)
                    self.recipeImageView.kf.setImage(with: url,
                                                     placeholder: UIImage(named: "https://www.mealauthority.com/wp-content/uploads/2017/03/Plated-Logo-Sized.png?x39217"),
                                                     options: [.transition(.fade(1))],
                                                     progressBlock: nil,
                                                     completionHandler: nil)
                }
            }
            self.activityIndicator.stopAnimating()
        })
        
    }
    
}
