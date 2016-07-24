//
//  Recipe.swift
//  Assignment3-Recipes
//
//  Created by Lovey on 7/24/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class Recipe {
    
    let name: String
    let cookTime: Int
    let descrip: String
    let ingredients: [String]
    let steps: [String]
    
    init(name: String, cookTime: Int, descrip: String, ingredients: [String], steps: [String]) {
        self.name = name
        self.cookTime = cookTime
        self.descrip = descrip
        self.ingredients = ingredients
        self.steps = steps
    }
    
    
}
