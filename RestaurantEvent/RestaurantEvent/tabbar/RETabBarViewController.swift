//
//  RETabbarViewController.swift
//  RestaurantEvent
//
//  Created by djzhang on 5/28/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation
import Dollar

protocol TabBarItemDelegate{
    func didPressButton(sender:UIButton,atIndex:Int)
}

class RETabBarViewController: UIViewController{
    class func instance() -> RETabBarViewController{
        return UIStoryboard(name: "RestaurantEvent", bundle: nil).instantiateViewControllerWithIdentifier("RETabBarViewController") as! RETabBarViewController
    }
    
    var delegate: TabBarItemDelegate?
    
    @IBOutlet weak var homeTabBarContainer: UIView!
    @IBOutlet weak var cameraTabBarContainer: UIView!
    @IBOutlet weak var activityFeedTabBarContainer: UIView!
    
    var buttons:[UIButton] = [UIButton]()
    var lastSelectedButton:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: layout
    func layoutViewController(tabBarInfos:[TabBarInfo] ,delegate: TabBarItemDelegate){
        self.delegate = delegate
        
        self.view.backgroundColor = UIColor.purpleColor()
        let containers:[UIView] = [homeTabBarContainer,cameraTabBarContainer,activityFeedTabBarContainer]
        for container in containers{
            container.backgroundColor = UIColor.clearColor()
        }
        
        for (index,tabBarInfo) in enumerate(tabBarInfos){
            let button:AZCenterLabelButton = AZCenterLabelButton()
            
            let normalImage = tabBarInfo.normalImage
            let selectedImage = tabBarInfo.selectedImage
            let title = tabBarInfo.title
            
            button.setImage(normalImage, forState: .Normal)
//            button.setImage(selectedImage, forState: .Selected)
            button.setTitle(title, forState: .Normal)
            
            button.titleLabel?.font = UIFont.systemFontOfSize(12)
            button.sizeToFit()
            
            buttons.append(button)
            button.addTarget(self, action: "tabButtonPressed:", forControlEvents: .TouchUpInside)
            
            containers[index].addSubview(button)
            button.LayoutCenter()
        }
    }
    
    // MARK: Buttons event
    func tabButtonPressed(sender:UIButton){
        let buttonIndex = $.indexOf(self.buttons, value: sender)
        self.delegate?.didPressButton(sender,atIndex:buttonIndex!)
    }
    
    // MARK: 
    func replaceSelectedButton(selectedButton:UIButton,tabBarInfos:[TabBarInfo]){
        if let theLastSelectedButton = self.lastSelectedButton{
            let oldButtonIndex = $.indexOf(self.buttons, value: theLastSelectedButton)
            theLastSelectedButton.setImage(tabBarInfos[oldButtonIndex!].normalImage, forState: .Normal)
        }

        let newButtonIndex = $.indexOf(self.buttons, value: selectedButton)
        selectedButton.setImage(tabBarInfos[newButtonIndex!].selectedImage, forState: .Normal)
        
        self.lastSelectedButton = selectedButton
    }
    
    
    
}