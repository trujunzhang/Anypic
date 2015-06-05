//
//  SPCellGenerator.swift
//  RestaurantPages
//
//  Created by djzhang on 6/5/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class SPCellGenerator {
    
    class func getCellWidth(height:CGFloat) -> CGFloat{ // (290/507)
        return height/507*290
    }
    
    class func getCellsContentSize(height:CGFloat,count:CGFloat) -> CGSize {
        let width = getCellWidth(height)*count
        return CGSizeMake(width, height)
    }
    
}