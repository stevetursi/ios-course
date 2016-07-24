//
//  RecipeMainViewController.swift
//  Assignment3-Recipes
//
//  Created by Lovey on 7/24/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit


class RecipeMainViewController: UITableViewController {

    var delegate: SelectRecipeDelegate?
    
    var model: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        model.append(Recipe(name: "chicken sammich", cookTime: 10, descrip: "A Tasty chicken sammich", ingredients: ["Chicken","Bun","Mayo","Tomato"], steps:
            ["Cook the chicken","Put the chicken on the bun","slather the bun in mayo","throw a tomato at it"]))
    
        model.append(Recipe(name: "root beer float", cookTime: 2, descrip: "American classic", ingredients: ["Root Beer","Ice Cream"], steps:
            ["Throw a scoop or two of ice cream into a glass","Pour some root beer over it"]))

        model.append(Recipe(name: "Hot Dog", cookTime: 5, descrip: "yum, meat byproducts", ingredients: ["Hot dog","Bun","Mustard"], steps:
            ["Cook the hot dog. Fry it, nuke it, bbq it, boil it, doesn't matter","Put it on a bun","Mustard to taste"]))

        
    
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecipeIdentifier", forIndexPath: indexPath)
        let item = model[indexPath.row]
        
        cell.textLabel?.text = "\(item.name) (\(item.cookTime) minutes)"
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailVc = segue.destinationViewController as? RecipeDetailViewController {
//            if let indexPath = tableView.indexPathForSelectedRow {
//                let recipe = model[indexPath.row]
//                
//            }
            detailVc.delegate = self
        }
    }
    
}

extension RecipeMainViewController: SelectRecipeDelegate {
    func getRecipe() -> Recipe {
        if let indexPath = tableView.indexPathForSelectedRow {
            return model[indexPath.row]
        }
        return Recipe(name: "error", cookTime: 0, descrip: "what happened?", ingredients: [], steps: [])
    }
}
