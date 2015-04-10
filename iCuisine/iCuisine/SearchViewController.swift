//
//  SearchViewController.swift
//  iCuisine
//
//  Created by Raphael Andrade on 4/3/15.
//  Copyright (c) 2015 Golden Avocado Labs. All rights reserved.
//

import Foundation
import UIKit


class SearchViewController: UIViewController {
    
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
            var venue: [Recipe] = []
            venue.append(Recipe(name: "Cheese Bread", ingredients: ["Cheese, Bread"], description: "Cheese bread", image: UIImage(named: "cheeseBread.jpg")!))
            venue.append(Recipe(name: "Bread", ingredients: ["Flour, Water"], description: "Commom bread", image: UIImage(named: "bread.jpeg")!))
            venueViewController.recipes = venue
        }
    }
    
}