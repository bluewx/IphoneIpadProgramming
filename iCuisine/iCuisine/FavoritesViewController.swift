//
//  FavoritesViewController.swift
//  iCuisine
//
//  Created by Raphael Andrade on 4/11/15.
//  Copyright (c) 2015 Golden Avocado Labs. All rights reserved.
//

import Foundation
import UIKit

class FavoritesViewController: UITableViewController {
    
    var recipes: [Recipe] = []
//    var favoriteRecipes: [Recipe] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()

        recipes = Static.Favorites.favoritesArray
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView (tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("favoritesCell") as! MyTableViewCell
 
        cell.nameLabel.text = recipes[indexPath.row].name
        cell.recipe = recipes[indexPath.row]


        if cell.recipe.isFav == true {
            cell.addFav.setBackgroundImage(UIImage(named: "red-heart.png"), forState: .Normal)
        }
        else {
            cell.addFav.setBackgroundImage(UIImage(named: "white-heart.png"), forState: .Normal)
        }

        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRecipe" {
            var venueViewController = segue.destinationViewController as! RecipeViewController
            var index = self.tableView.indexPathForSelectedRow()!
            var venue = self.recipes[index.row]
            venueViewController.recipe = venue
        }
    }
}
