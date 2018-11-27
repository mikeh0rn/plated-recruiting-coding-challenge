//
//  RecipesViewController.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var recipesArray = [RecipeViewModel]()
    var apiManager = APIManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiManager.recipes(completion: { result in
            self.activityIndicator.startAnimating()
            if result.count > 0 {
                for item in result {
                    self.recipesArray.append(item)
                    
                }
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecipesOnMenuTableViewCell
        
        cell.recipeName.text = recipesArray[indexPath.row].name
        cell.recipeDescription.text = recipesArray[indexPath.row].description
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                let url = URL(string: (self.recipesArray[indexPath.row].image)!)
                cell.recipeImg.kf.setImage(with: url,
                                           placeholder: UIImage(named: "https://www.mealauthority.com/wp-content/uploads/2017/03/Plated-Logo-Sized.png?x39217"),
                                           options: [.transition(.fade(1))],
                                           progressBlock: nil,
                                           completionHandler: nil)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segueToRecipeDetail", sender: recipesArray[indexPath.row].id)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let recipeDetailVC = segue.destination as! RecipeDetailViewController
        recipeDetailVC.recipeId = sender as! Int
    }
    
    
}

