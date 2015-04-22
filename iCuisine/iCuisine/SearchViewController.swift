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
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let favoritesDefaults = NSUserDefaults.standardUserDefaults()
        
        if let data = favoritesDefaults.objectForKey("recipe") as? NSData {
            let unarc = NSKeyedUnarchiver(forReadingWithData: data)
            let newR = unarc.decodeObjectForKey("root") as! [Recipe]
            
            Static.Favorites.favoritesArray = newR
        }
        // Do any additional setup after loading the view, typically from a nib.
    }    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "results" {
            
            var venueViewController =  segue.destinationViewController as! Results
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
            
            println(urlString)
            
            venueViewController.urlPath = urlString
        }

    }
    
}