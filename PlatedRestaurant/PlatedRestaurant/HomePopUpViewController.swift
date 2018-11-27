//
//  HomePopUpViewController.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import UIKit

class HomePopUpViewController: UIViewController, SBCardPopupContent {
    
    var popupViewController: SBCardPopupViewController?
    var allowsTapToDismissPopupCard: Bool = true
    var allowsSwipeToDismissPopupCard: Bool = true
    
    static func create() -> UIViewController {
        let homePopUpViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomePopUpViewController") as! HomePopUpViewController
        return homePopUpViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didSelectLunchButton(_ sender: UIButton) {
        self.popupViewController?.close()
    }
    
    @IBAction func didSelectDinnerButton(_ sender: UIButton) {
        self.popupViewController?.close()
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
