//
//  UIViewControllerStoryboardExtensions.swift
//  RestaurantEvent
//
//  Created by djzhang on 5/27/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation



extension PAWLoginViewController {
    
    class func instance() -> PAWLoginViewController {
        let storyboard = UIStoryboard(name: "main", bundle: nil)
        
        return storyboard.instantiateViewControllerWithIdentifier("PAWLoginViewController") as! PAWLoginViewController
    }
}