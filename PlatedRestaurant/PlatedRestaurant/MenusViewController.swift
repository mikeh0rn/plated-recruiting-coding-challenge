//
//  MenusViewController.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import UIKit

class MenusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var menusArray = [MenuViewModel]()
    var apiManager = APIManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiManager.menus(completion: { result in
            if result.count > 0 {
                for item in result {
                    print(item.id)
                    print(item.title)
                    self.menusArray.append(item)
                    
                }
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menusArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = menusArray[indexPath.row].title
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segueToRecipesOnMenu", sender: menusArray[indexPath.row].id)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let recipesOnMenuVC = segue.destination as! RecipesOnMenuViewController
        recipesOnMenuVC.menuId = sender as! Int
    }
 

}
