//
//  File.swift
//  iCuisine
//
//  Created by William Dalmorra De Souza on 4/3/15.
//  Copyright (c) 2015 Golden Avocado Labs. All rights reserved.
//

import Foundation
import UIKit

class Recipe{
    
    var name: NSString;
    var ingredients: [NSString];
    var image: UIImage?;
    var description: NSString;
    init(){
        name = ""
        ingredients = []
        description = ""
    }
    
    init(name: NSString, ingredients: [NSString], description: NSString, image: UIImage ){
        self.name = name
        self.ingredients = ingredients
        self.image = image
        self.description = description
        
    }
    
}