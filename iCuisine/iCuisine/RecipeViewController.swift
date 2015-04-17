//
//  RecipeViewController.swift
//  iCuisine
//
//  Created by Raphael Andrade on 4/10/15.
//  Copyright (c) 2015 Golden Avocado Labs. All rights reserved.
//

import Foundation
import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var recipeName: UINavigationItem!
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var repiceIngredients: UITextView!
    
    @IBOutlet weak var recipeDescription: UITextView!
    
    var recipe: Recipe!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        if recipe != nil {
            recipeName.title = recipe.name
            recipeImage.image = UIImage(named: recipe.image)
            recipeDescription.text = recipe.recipeDescription
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}