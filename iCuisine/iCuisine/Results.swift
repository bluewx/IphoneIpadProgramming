//
//  Results.swift
//  iCuisine
//
//  Created by William Dalmorra De Souza on 4/3/15.
//  Copyright (c) 2015 Golden Avocado Labs. All rights reserved.
//

import Foundation
import UIKit

class Results: UITableViewController {
    
    var recipes: [Recipe] = []
//    var favoriteRecipes: [Recipe] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
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
        
        var cell = tableView.dequeueReusableCellWithIdentifier("resultsCell") as! MyTableViewCell
        
        cell.nameLabel.text = recipes[indexPath.row].name
//        cell.favoriteRecipes = favoriteRecipes
        cell.recipe = recipes[indexPath.row]
        if cell.recipe.isFav == true {
            cell.addFav.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
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