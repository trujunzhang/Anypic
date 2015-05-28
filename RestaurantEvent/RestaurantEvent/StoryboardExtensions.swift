//
//  StoryboardExtensions.swift
//  RestaurantEvent
//
//  Created by djzhang on 5/28/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation


extension RETabBarViewController{
   class func instance() -> RETabBarViewController{
        return UIStoryboard(name: "RestaurantEvent", bundle: nil).instantiateViewControllerWithIdentifier("RETabBarViewController") as! RETabBarViewController
    }
}