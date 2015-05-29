//
//  RETabbarModel.swift
//  RestaurantEvent
//
//  Created by djzhang on 5/28/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

enum TabBarType: Int{
    case Normal
    case Camera
}

struct TabBarInfo {
    var type:TabBarType?
    var title = ""
    var normalImage: UIImage?
    var selectedImage: UIImage?
    var contentController : UIViewController
}


class RETabBarGenerator{
    class func generateTabBarInfos() -> [TabBarInfo]{

        let homeTabBarInfo = TabBarInfo(type: .Normal,  title: "Home" ,normalImage: makeImageRenderingModeAlwaysOriginal("IconHome"), selectedImage: makeImageRenderingModeAlwaysOriginal( "IconHomeSelected"), contentController: UIViewController())
        
        let cameraTabBarInfo = TabBarInfo(type: .Normal,  title: "" ,normalImage: makeImageRenderingModeAlwaysOriginal("IconHome"), selectedImage: makeImageRenderingModeAlwaysOriginal( "IconHomeSelected"), contentController: UIViewController())

        let activityTabBarInfo = TabBarInfo(type: .Normal,  title: "Activity" ,normalImage: makeImageRenderingModeAlwaysOriginal("IconTimeline"), selectedImage: makeImageRenderingModeAlwaysOriginal( "IconTimelineSelected"), contentController: UIViewController())

        return [homeTabBarInfo,cameraTabBarInfo,activityTabBarInfo]
    }
    
    class func makeImageRenderingModeAlwaysOriginal(named:String) ->UIImage{
        return UIImage(named:named)!.imageWithRenderingMode(.AlwaysOriginal)
    }
}