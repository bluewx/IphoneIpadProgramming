//
//  MyTableViewCell.swift
//  iCuisine
//
//  Created by Raphael Andrade on 4/10/15.
//  Copyright (c) 2015 Golden Avocado Labs. All rights reserved.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var addFav: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}