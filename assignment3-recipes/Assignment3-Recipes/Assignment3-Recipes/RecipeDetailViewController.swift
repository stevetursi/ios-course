//
//  ViewController.swift
//  Assignment3-Recipes
//
//  Created by Lovey on 7/24/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

protocol SelectRecipeDelegate {
    func getRecipe() -> Recipe
}



class RecipeDetailViewController: UIViewController {

    var delegate: SelectRecipeDelegate?
    
    @IBOutlet weak var detailTitle: UINavigationItem!
    @IBOutlet weak var detailDescrip: UILabel!
    @IBOutlet weak var cookTime: UILabel!
    @IBOutlet weak var recipeBody: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let recipe = delegate?.getRecipe()
        
        detailTitle?.title = recipe?.name
        detailDescrip?.text = recipe?.descrip
        if let myCookTime = recipe?.cookTime {
            cookTime?.text = "Cook Time: \(myCookTime) minutes"
        }
        var body: String = "Ingredients:\n"
        
        for ingredient in (recipe?.ingredients)! {
                body += "\(ingredient)\n"
        }

       body += "\nInstructions:\n"
        
        for step in (recipe?.steps)! {
            body += "\(step)\n"
        }


        recipeBody?.text = body
        
    }

}

