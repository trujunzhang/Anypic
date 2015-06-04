//
//  ParseAbstractTableCell.swift
//  RestaurantEvent
//
//  Created by djzhang on 5/31/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation


class ParseAbstractTableCell: PFTableViewCell {
//class ParseAbstractTableCell: PFCollectionViewCell {
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        self.backgroundColor = UIColor.clearColor()
    }
    

    
    // MARK: Setup table cell by object instanced PFObject
    func setCell(object:PFObject){
        
    }
}