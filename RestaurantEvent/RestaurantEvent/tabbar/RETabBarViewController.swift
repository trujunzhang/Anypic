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
    @IBOutlet weak var homeTabBarItem: UIButton!
    
    @IBOutlet weak var cameraTabBarContainer: UIView!
    @IBOutlet weak var cameraTabBarItem: UIButton!
    
    @IBOutlet weak var activityFeedTabBarContainer: UIView!
    @IBOutlet weak var activityFeedTabBarItem: UIButton!
    
    var buttons:[UIButton] = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.buttons = [homeTabBarItem,cameraTabBarItem,activityFeedTabBarItem]
        
        let buttonObjects = ["IconHome","IconHomeSelected","Home","IconHome","IconHomeSelected","Home","IconHome","IconHomeSelected","Home"]
        
        let index = 0
        let button:AZCenterLabelButton = AZCenterLabelButton()
        
        let normalImage = UIImage(named: buttonObjects[index*3+0])
        let selectedImage = UIImage(named: buttonObjects[index*3+1])
        let title = buttonObjects[index*3+2]
        
        button.setImage(normalImage, forState: .Normal)
        button.setImage(selectedImage, forState: .Selected)
        button.setTitle(title, forState: .Normal)
        
        button.titleLabel?.font = UIFont.systemFontOfSize(12)
        button.sizeToFit()
        
        self.homeTabBarContainer.addSubview(button)
        button.LayoutCenter()

    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    
}