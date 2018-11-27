//
//  MenuViewModel.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class MenuViewModel {
    
    private var menu = Menu()
    
    init(menu: Menu) {
        self.menu = menu
    }
    
    init(){
    }
    
    var id: Int? {
        if let menuId = menu.id {
            return menuId
        }
        return 0
    }
    
    var title: String? {
        if let menuTitle = menu.title {
            return menuTitle
        }
        return ""
    }
    
    
}
