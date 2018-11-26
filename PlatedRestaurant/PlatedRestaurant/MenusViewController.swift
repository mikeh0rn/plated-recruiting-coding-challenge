//
//  MenusViewController.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import UIKit

class MenusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var menusArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menusArray.append("Italian")
        menusArray.append("Chinese")
        menusArray.append("Mexican")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menusArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = menusArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "", sender: menusArray[indexPath.row])
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let recipesOnMenuVC = segue.destination as! RecipesOnMenuViewController
//        recipesOnMenuVC.stringToPass = sender
    }
 

}
