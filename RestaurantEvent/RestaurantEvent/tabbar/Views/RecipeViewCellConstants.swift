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
    
    class func getTableIdentify(type:Int) -> String{
        if(type == 0){
            return "UserHeaderViewCell"
        }else if (type == 1){
            return "RecipeLocationViewCell"
        }
        
        return "RecipePhotoViewCell"
    }
}