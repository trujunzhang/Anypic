//
//  RETabbarViewController.swift
//  RestaurantEvent
//
//  Created by djzhang on 5/28/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation


class RETabBarViewController: UIViewController{
    
    @IBOutlet weak var homeTabBarContainer: UIView!
    
    @IBOutlet weak var cameraTabBarContainer: UIView!
    
    @IBOutlet weak var activityFeedTabBarContainer: UIView!
    
    var buttons:[UIButton] = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let containers:[UIView] = [homeTabBarContainer,cameraTabBarContainer,activityFeedTabBarContainer]
        let tabBarInfos:[TabBarInfo] =  RETabBarGenerator.generateTabBarInfos()
        for (index,tabBarInfo) in enumerate(tabBarInfos){
            let button:AZCenterLabelButton = AZCenterLabelButton()
            
            let normalImage = tabBarInfo.normalImage
            let selectedImage = tabBarInfo.selectedImage
            let title = tabBarInfo.title
            
            button.setImage(normalImage, forState: .Normal)
            button.setImage(selectedImage, forState: .Selected)
            button.setTitle(title, forState: .Normal)
            
            button.titleLabel?.font = UIFont.systemFontOfSize(12)
            button.sizeToFit()
            
            containers[index].addSubview(button)
            button.LayoutCenter()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    
}