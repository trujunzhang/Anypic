//
//  RecipeViewCellConstants.swift
//  RestaurantEvent
//
//  Created by djzhang on 5/31/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation


enum RestaurantTableRowType:Int{
    case UserInfo
    case RecipeLocation
    case RecipePhoto
}

class RestaurantTableUtils: NSObject{
    
    class func getTableCellIdentify(type:Int) -> String{
        if(type == 0){
            return "UserHeaderViewCell"
        }else if (type == 1){
            return "RecipeLocationViewCell"
        }
        
        return "RecipePhotoViewCell"
    }
    
    class func getTableCellHeight(type:Int,width:CGFloat) -> CGFloat{
        if(type == 0){
            return 44
        }else if (type == 1){
            return 120
        }
        
        // 560 × 350
        return (width/560)*350
    }
}