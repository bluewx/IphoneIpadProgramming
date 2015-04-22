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
    
    var recipe: Recipe!
    
    @IBOutlet weak var addFav: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    let favorites = NSUserDefaults.standardUserDefaults()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func saveFavorites(sender: AnyObject) {
        
        if !recipe.isFav {
            println("INSERINDO FAV")
            let favoritesDefaults = NSUserDefaults.standardUserDefaults()
            recipe.isFav = true
            addFav.setBackgroundImage(UIImage(named: "Red-heart.png"), forState: .Normal)
            
            Static.Favorites.favoritesArray.append(recipe)
        
            favoritesDefaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(Static.Favorites.favoritesArray), forKey: "recipe")
        }
        else {
            println("TIRANDO FAV")
            let favoritesDefaults = NSUserDefaults.standardUserDefaults()
            recipe.isFav = false
            addFav.setBackgroundImage(UIImage(named: "white-heart.jpeg"), forState: .Normal)
            
            Static.Favorites.favoritesArray.removeAtIndex(findIndexOfRecipe(self.recipe))
            
            favoritesDefaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(Static.Favorites.favoritesArray), forKey: "recipe")
        }
    }
    
    func findIndexOfRecipe(recipeToBeFound: Recipe) -> Int {
        for index in 0..<Static.Favorites.favoritesArray.count {
            if ( recipeToBeFound.equals(Static.Favorites.favoritesArray[index]) ) {
                return index
            }
        }
        return -1
    }
    
}