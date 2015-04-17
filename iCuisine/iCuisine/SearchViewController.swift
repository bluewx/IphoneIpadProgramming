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
            var venueViewController =  segue.destinationViewController as! Results
            var venue : [Recipe] = []
            //TODO adicionar referencias de pesquisa do database escolhido
            venue.append(Recipe(name: "Cheese Bread", ingredients: ["Cheese, Bread"], description: "Cheese bread", image:"cheeseBread.jpg"))
            venue.append(Recipe(name: "Bread", ingredients: ["Flour, Water"], description: "Commom bread", image:"bread.jpeg"))
            
            venueViewController.recipes = venue
//            venueViewController.favoriteRecipes = self.favoriteRecipes
//            venueViewController.favoriteRecipes = Static.Favorites.favoritesArray
        }
        
        if segue.identifier == "favorites" {
            var favorites: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            var venueViewController = segue.destinationViewController as! FavoritesViewController
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