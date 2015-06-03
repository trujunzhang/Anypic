//
//  RETabbarModel.swift
//  RestaurantEvent
//
//  Created by djzhang on 5/28/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

enum TabBarType: Int{
    case Home
    case Camera
    case Activity
}

struct TabBarInfo {
    var type:TabBarType?
    var title = ""
    var normalImage: UIImage?
    var selectedImage: UIImage?
    var edge: UIEdgeInsets?
    var contentController : UIViewController
}


class RETabBarGenerator{
    class func generateTabBarInfos() -> [TabBarInfo]{

//        let homeTabBarInfo = TabBarInfo(type: .Home,  title: "Home" ,normalImage: makeImageRenderingModeAlwaysOriginal("IconHome"), selectedImage: makeImageRenderingModeAlwaysOriginal( "IconHomeSelected"),edge:UIEdgeInsetsMake(0,20,0,20), contentController: RestaurantListViewController.instance())
        
        let homeTabBarInfo = TabBarInfo(type: .Home,  title: "Home" ,normalImage: makeImageRenderingModeAlwaysOriginal("IconHome"), selectedImage: makeImageRenderingModeAlwaysOriginal( "IconHomeSelected"),edge:UIEdgeInsetsMake(0,20,0,20), contentController: RestaurantCollectionViewController.instance())
        
        
        let cameraTabBarInfo = TabBarInfo(type: .Camera,  title: "" ,normalImage: makeImageRenderingModeAlwaysOriginal("IconHome"), selectedImage: makeImageRenderingModeAlwaysOriginal( "IconHomeSelected"),edge:UIEdgeInsetsZero,  contentController: UIViewController())

        let activityTabBarInfo = TabBarInfo(type: .Activity,  title: "Activity" ,normalImage: makeImageRenderingModeAlwaysOriginal("IconTimeline"), selectedImage: makeImageRenderingModeAlwaysOriginal( "IconTimelineSelected"), edge:UIEdgeInsetsZero, contentController: UIViewController())

        return [homeTabBarInfo,cameraTabBarInfo,activityTabBarInfo]
    }
    
    class func makeImageRenderingModeAlwaysOriginal(named:String) ->UIImage{
//        return UIImage(named:named)!.imageWithRenderingMode(.AlwaysOriginal)
//        return UIImage(named:"AppIcon")!.imageWithRenderingMode(.AlwaysOriginal)
        return UIImage()
    }
}