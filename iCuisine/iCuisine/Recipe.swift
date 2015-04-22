//
//  File.swift
//  iCuisine
//
//  Created by William Dalmorra De Souza on 4/3/15.
//  Copyright (c) 2015 Golden Avocado Labs. All rights reserved.
//

import Foundation
import UIKit

class Static {
    struct Favorites {
        static var favoritesArray = [Recipe]()
    }
}

@objc(Recipe)
class Recipe : NSObject, NSCoding{
    
    var name: String!;
    var ingredients: [String]!;
    var image: String!;
    var recipeDescription: String!;
    var isFav: Bool! = false
    
    init(name: String, ingredients: [String], description: String, image: String ){
        self.name = name
        self.ingredients = ingredients
        self.image = image
        self.recipeDescription = description
    }
    
    required init (coder aDecoder: NSCoder){
        if let rName = aDecoder.decodeObjectForKey("name") as? String {
            self.name = rName
        }
        if let rIng = aDecoder.decodeObjectForKey("ingredients") as? [String] {
            self.ingredients = rIng
        }
        if let rIma = aDecoder.decodeObjectForKey("image") as? String {
            self.image = rIma
        }
        if let rDesc = aDecoder.decodeObjectForKey("recipeDescription") as? String {
            self.recipeDescription = rDesc
        }
        if let risF = aDecoder.decodeObjectForKey("isFav") as? Bool {
            self.isFav = risF
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let rName = self.name {
            aCoder.encodeObject(rName, forKey: "name")
        }
        if let rIng = self.ingredients {
            aCoder.encodeObject(rIng, forKey: "ingredients")
        }
        if let rIma = self.image {
            aCoder.encodeObject(rIma, forKey: "image")
        }
        if let rDesc = self.recipeDescription {
            aCoder.encodeObject(rDesc, forKey: "recipeDescription")
        }
        if let risF = self.isFav {
            aCoder.encodeObject(risF, forKey: "isFav")
        }
    }
    
    func equals(r: Recipe) -> Bool{
        if (r.name == self.name) {
            return true
        } else {
            return false
        }
    }
    
    
}