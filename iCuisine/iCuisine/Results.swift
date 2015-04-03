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
    
    var recipes = [Recipe]()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        recipes.append(Recipe(name: "Recipe 1", ingredients: ["banana","strawberry","potato","rice"], description: "Best recipe ever",image: UIImage()))
        
        recipes.append(Recipe(name: "Recipe 2", ingredients: ["beans","rice","potato","beef"], description: "Best recipe ever",image: UIImage()))
        
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
        var cell = tableView.dequeueReusableCellWithIdentifier("resultsCell") as UITableViewCell
        cell.textLabel!.text = self.recipes[indexPath.row].name
        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showDetails" {
//            var venueViewController = segue.destinationViewController as DiningVenueViewController
//            var index = self.tableView.indexPathForSelectedRow()!
//            var venue = self.venues[index.row]
//            venueViewController.venueInformation = venue
//        }
    }
}