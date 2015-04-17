//
//  MyTableViewCell.swift
//  iCuisine
//
//  Created by Raphael Andrade on 4/10/15.
//  Copyright (c) 2015 Golden Avocado Labs. All rights reserved.
//


// FIX THE ISFAV FUNCTIONALITY! CHECK IF A RECIPE IS ALREADY IN THE FAVORITE LIST

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    
    var favoriteRecipes: [Recipe] = []
    
    var recipe: Recipe!
    
    @IBOutlet weak var addFav: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    let favorites = NSUserDefaults.standardUserDefaults()
    
    var isFav: Bool = false;
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func saveFavorites(sender: AnyObject) {
        
        if !recipe.isFav {
        
            let favoritesDefaults = NSUserDefaults.standardUserDefaults()
        
            Static.Favorites.favoritesArray.append(recipe)
        
            favoritesDefaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(Static.Favorites.favoritesArray), forKey: "recipe")
            
            recipe.isFav = true
        }
    }
    
}