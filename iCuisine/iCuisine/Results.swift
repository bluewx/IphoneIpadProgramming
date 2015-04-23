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
    
    var urlPath: String = ""
    var recipes: [Recipe] = []
    var finishedNum = 0
    
    @IBOutlet var myTableView: UITableView!
    
    func synced(lock: AnyObject, closure: () -> ()) {
        objc_sync_enter(lock)
        closure()
        objc_sync_exit(lock)
    }
    func finished(){
        synced(finishedNum){
            self.finishedNum += 1
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        var url = NSURL(string: urlPath)
        println(url)
        var request = NSURLRequest(URL: url!)
        
        
        // requisicao principal
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.currentQueue()) { response, maybeData, error in
            var count = -1
            if let data = maybeData {
                //
                let json = JSON(data: data)
                
                count = json["count"].intValue
                var desc: String = ""
                
                for index in 0..<count{
                    var ing: [String] = []
                    var name: String = json["results"][index]["name"].stringValue
                    for s in json["results"][index]["ingredients"].arrayValue{
                        ing.append(s.stringValue)
                    }
                    
                    // pegar desricao 
                    url = NSURL(string: json["results"][index]["url"].stringValue)
                    request = NSURLRequest(URL: url!)
                    var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil;
                    var error: AutoreleasingUnsafeMutablePointer<NSErrorPointer?> = nil;
                    var responseData = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: nil) as NSData?
                    
                    if error != nil {
                        println("ERROR")
                    }
                    else {
                        let json = JSON(data: responseData!)
                        
                        for i in json["directions"].arrayValue{
                            desc += i.stringValue + "\n"
                        }
                    }
                    // pegar desricao
                    url = NSURL(string: json["results"][index]["image"].stringValue)
                    request = NSURLRequest(URL: url!)
                    var response2: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil;
                    var error2: AutoreleasingUnsafeMutablePointer<NSErrorPointer?> = nil;
                    var responseData2 = NSURLConnection.sendSynchronousRequest(request, returningResponse: response2, error: nil) as NSData?
                    
                    if error2 != nil {  
                        println("ERROR")
                    }
                    else {
                        // DOWNLOAD IMAGE
                        let recipeImage = UIImage(data: responseData2!)
                        var fileName = name + ".png"
                        var arrayPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! NSString
                        
                        var pngFileName = arrayPaths.stringByAppendingPathComponent(fileName)

                        if recipeImage != nil {
                        
                            UIImagePNGRepresentation(recipeImage).writeToFile(pngFileName, atomically:true)
                        } else {
                            pngFileName = ""
                        }
                        
                        println(pngFileName)
                        self.recipes.append(Recipe(name: name, ingredients: ing, description: desc, image:pngFileName))
                    }
                    
                }
            } else {
                println(error.localizedDescription)
            }
            self.myTableView.reloadData()
        }
        
        
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
        cell.recipe = recipes[indexPath.row]
        cell.recipe.isFav = false
        
        for index in 0..<Static.Favorites.favoritesArray.count {
            if (cell.recipe.equals(Static.Favorites.favoritesArray[index]) ) {
                cell.recipe.isFav = true
                break
            }
        }
        
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