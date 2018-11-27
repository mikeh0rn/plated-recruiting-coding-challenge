//
//  Menu.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class Menu {
    var id: Int? = 0
    var title: String? = ""
    
    init(menuJSON: JSON) {
        self.id = menuJSON["id"].intValue
        self.title = menuJSON["title"].stringValue
    }
    
    init() {
    }
}

