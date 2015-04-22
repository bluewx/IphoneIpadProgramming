//
//  SearchViewController.swift
//  iCuisine
//
//  Created by Raphael Andrade on 4/3/15.
//  Copyright (c) 2015 Golden Avocado Labs. All rights reserved.
//

import Foundation
import UIKit

//class Static {
//    struct Favorites {
//        static var favoritesArray = [Recipe]()
//    }
//}

class SearchViewController: UIViewController {
    
//    var favoriteRecipes: [Recipe] = []
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "results" {
            
            var venueViewController =  segue.destinationViewController as Results
            
            var urlString: String = "http://api.pearson.com:80/kitchen-manager/v1/recipes?ingredients-all="
            
            var userInput = textField.text
            userInput = userInput.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
            var userInputArr = userInput.componentsSeparatedByString(",")
            
            println(userInputArr)

            for s in userInputArr {
                urlString += s
                urlString += "%2C"
            }
            
            urlString += "&limit=300"
            
            // DAR SPLIT EM COMMAS E ADD NO urlString
            
            println(urlString)
            
            venueViewController.urlPath = urlString
        }
        
        if segue.identifier == "favorites" {
            var favorites: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            var venueViewController = segue.destinationViewController as FavoritesViewController
            var venue: [Recipe] = []
            if let recipe = favorites.objectForKey("favorites") as? Recipe {
                venue.append(recipe)
            }
            venueViewController.recipes = venue
//            venueViewController.favoriteRecipes = favoriteRecipes
//            venueViewController.favoriteRecipes = Static.Favorites.favoritesArray
        }
    }
    
}