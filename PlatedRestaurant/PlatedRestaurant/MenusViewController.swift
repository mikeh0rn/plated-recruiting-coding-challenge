//
//  MenusViewController.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import UIKit

class MenusViewController: UIViewController {
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var menusArray = [MenuViewModel]()
    var apiManager = APIManager.sharedInstance
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if topButton.currentTitle == nil || bottomButton.currentTitle == nil {
            self.activityIndicator.startAnimating()
            apiManager.menus(completion: { result in
                if result.count > 0 {
                    for item in result {
                        self.menusArray.append(item)
                        if self.menusArray.count == 2 {
                            self.populateButtonWithData()
                        }
                    }
                }
            })
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func populateButtonWithData() {
        self.topButton.setTitle(self.menusArray[0].title, for: UIControl.State.normal)
        self.topButton.tag = self.menusArray[0].id ?? 0
        
        self.bottomButton.setTitle(self.menusArray[1].title, for: UIControl.State.normal)
        self.bottomButton.tag = self.menusArray[1].id ?? 0
        self.activityIndicator.stopAnimating()
    }
    

    @IBAction func buttonSelected(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToRecipesOnMenu", sender: sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let recipesOnMenuVC = segue.destination as! RecipesOnMenuViewController
        recipesOnMenuVC.menuId = sender as! Int
    }
    
    
}
