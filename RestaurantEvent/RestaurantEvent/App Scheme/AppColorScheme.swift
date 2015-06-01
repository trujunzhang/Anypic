//
//  AppColorScheme.swift
//  RestaurantEvent
//
//  Created by djzhang on 6/1/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

extension UIColor {
    
    //Main Color
    class func applicationMainColor() -> UIColor {
        return UIColor(red: 238/255, green: 64/255, blue: 86/255, alpha:1)
    }
    
    //Second Color
    class func applicationSecondColor() -> UIColor {
        return UIColor.lightGrayColor()
    }
    
    //Warning Color
    class func applicationWarningColor() -> UIColor {
        return UIColor(red: 0.1, green: 1, blue: 0, alpha: 1)
    }
    
    //Link Color
    class func applicationLinkColor() -> UIColor {
        return UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha:1)
    }
}

extension UILabel {
    var colorString: String {
        set(newValue) {
            switch newValue {
            case "main":
                self.textColor = UIColor.applicationMainColor()
            case "second":
                self.textColor = UIColor.applicationSecondColor()
            case "warning":
                self.textColor = UIColor.applicationWarningColor()
            default:
                self.textColor = UIColor.applicationSecondColor()
            }
        }
        get {
            return self.colorString
        }
    }
}

class TabBarColorSchemeUtils{
    func configTabBar(tabBar:UITabBar) {
        let items = tabBar.items
        for item in items as! [UITabBarItem] {
            let dic = NSDictionary(object: UIColor.applicationMainColor(),
                forKey:   NSForegroundColorAttributeName)
            item.setTitleTextAttributes(dic as [NSObject : AnyObject],
                forState: UIControlState.Selected)
        }
    }
}