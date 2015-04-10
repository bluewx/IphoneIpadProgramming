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
    
    var name: String;
    var ingredients: [String];
    var image: UIImage?;
    var description: String;
    @IBOutlet weak var button: UIButton!
    
    init(name: String, ingredients: [String], description: String, image: UIImage ){
        self.name = name
        self.ingredients = ingredients
        self.image = image
        self.description = description   
    }
    
}