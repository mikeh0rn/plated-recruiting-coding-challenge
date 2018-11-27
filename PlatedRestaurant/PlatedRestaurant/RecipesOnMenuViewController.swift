//
//  RecipesOnMenuViewController.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import UIKit

class RecipesOnMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var apiManager = APIManager.sharedInstance
    var menuId = Int()
    var recipesArray = [RecipeViewModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiManager.recipesOnMenu(id: menuId, completion: { result in
            if result.count > 0 {
                for item in result {
                    print(item.name)
                    print(item.image)
                    print(item.id)
                    print(item.description)
                    self.recipesArray.append(item)
                    
                }
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = recipesArray[indexPath.row].name
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segueToRecipeDetailFromRecipesOnMenu", sender: recipesArray[indexPath.row].id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let recipeDetailVC = segue.destination as! RecipeDetailViewController
        recipeDetailVC.recipeId = sender as! Int
    }
    
    
}
