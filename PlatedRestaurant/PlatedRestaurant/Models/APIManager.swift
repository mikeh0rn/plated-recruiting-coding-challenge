//
//  APIManager.swift
//  PlatedRestaurant
//
//  Created by Mike Horn on 11/26/18.
//  Copyright © 2018 Mike Horn. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class APIManager {
    
    static let sharedInstance = APIManager()
    
    let apiToken = ""

    private var recipeId = Int()
    
    let baseURL = "https://plated-coding-challenge.herokuapp.com/v1"
    
    var headers: HTTPHeaders {
        get {
            return [
                "Authorization" : "Token token=\(apiToken)"
            ]
        }
    }
    
    func menus(completion : @escaping ([MenuViewModel]) -> Void) {
        
        let url = baseURL + "/menus.json"
        
        Alamofire.request(url, headers: headers)
            
            .validate { _, _, _ in
                return .success
            }
            .responseJSON { response in
                print("response", response)
                if let data: Data = response.data {
                    guard let json = try? JSON(data: data) else { return }
                    completion(self.menusFromJSON(incomingJSON: json))
                }
        }
    }
    
    
    func menu(menuId: Int, completion : @escaping (MenuViewModel) -> Void) {
        let url = baseURL + "/\(menuId)/menu.json"
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            
            .validate { _, _, _ in
                return .success
            }
            .responseJSON { response in
                if let data: Data = response.data {
                    guard let json = try? JSON(data: data) else { return }
                    completion(self.menuFromJSON(incomingJSON: json))
                }
        }
        
    }
    
    
    func recipesOnMenu(id: Int, completion: @escaping ([RecipeViewModel]) -> Void) {
        
        let url = baseURL + "/menus/\(id)/recipes.json"
        
        Alamofire.request(url, headers: headers)
            
            .validate {_, _, _ in
                return .success
            }
            .responseJSON { response in
                if let data: Data = response.data {
                    guard let json = try? JSON(data: data) else { return }
                    completion(self.recipesFromJSON(incomingJSON: json))
                }
        }
    }
    
    func recipes(completion : @escaping ([RecipeViewModel]) -> Void) {
        
        let url = baseURL + "/recipes.json"
        
        Alamofire.request(url, headers: headers)
            
            .validate { _, _, _ in
                return .success
            }
            .responseJSON { response in
                if let data: Data = response.data {
                    guard let json = try? JSON(data: data) else { return }
                    completion(self.recipesFromJSON(incomingJSON: json))
                }
        }
    }
    
    func recipe(recipeId: Int, completion : @escaping (RecipeViewModel) -> Void) {
        let url = baseURL + "/recipes/\(recipeId).json"
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            
            .validate { _, _, _ in
                return .success
            }
            .responseJSON { response in
                if let data: Data = response.data {
                    guard let json = try? JSON(data: data) else { return }
                    completion(self.recipeFromJSON(incomingJSON: json))
                }
        }
        
    }
    
    func menuFromJSON(incomingJSON: SwiftyJSON.JSON) -> MenuViewModel {
        return MenuViewModel(menu: Menu(menuJSON: incomingJSON))
    }
    
    func menusFromJSON(incomingJSON: SwiftyJSON.JSON) -> [MenuViewModel] {
        var menuViewModels: [MenuViewModel] = []
        
        for (_, subJson):(String, JSON) in incomingJSON {
            
            menuViewModels.append(MenuViewModel(menu: Menu(menuJSON: subJson)))
        }
        
        return menuViewModels
    }
    
    func recipeFromJSON(incomingJSON: SwiftyJSON.JSON) -> RecipeViewModel {
        return RecipeViewModel(recipe: Recipe(recipeJSON: incomingJSON))
    }
    
    func recipesFromJSON(incomingJSON: SwiftyJSON.JSON) -> [RecipeViewModel] {
        var recipeViewModels: [RecipeViewModel] = []
        
        for (_, subJson):(String, JSON) in incomingJSON {
            
            recipeViewModels.append(RecipeViewModel(recipe: Recipe(recipeJSON: subJson)))
        }
        
        return recipeViewModels
    }
    
    
    
}



