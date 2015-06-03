//
//  RecipeLocationViewCell.swift
//  RestaurantEventBDD
//
//  Created by djzhang on 5/30/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit

class RecipeLocationViewCell: ParseAbstractTableCell {

    @IBOutlet weak var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    // MARK: Setup table cell by object instanced PFObject
    override func setCell(object:PFObject){
        let x = 0
    }

}
