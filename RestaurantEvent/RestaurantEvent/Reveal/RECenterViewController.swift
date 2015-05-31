//
//  RECenterViewController.swift
//  RestaurantEvent
//
//  Created by djzhang on 5/28/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class RECenterViewController: UIViewController ,TabBarItemDelegate{
    
    let tabBarViewController: RETabBarViewController = RETabBarViewController.instance()
    lazy var tabBarInfos:[TabBarInfo] =  { return RETabBarGenerator.generateTabBarInfos() }()
    
    lazy var presentationView:UIView = {
        return UIView()
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Center Panel"
        
        //self.tabBarViewControlle
        self.addChildViewController(self.tabBarViewController)
        self.view.addSubview(self.tabBarViewController.view)
        
        self.tabBarViewController.view.layoutPanelBottomMargin(50)
        self.tabBarViewController.layoutViewController(tabBarInfos,delegate:self)
        
        // current presentationView
        //        self.selectViewController(, button: <#UIButton#>)
    }
    
    func selectViewController(viewController:ViewController,button:UIButton){
        
    }
    
    // MARK: TabBarItemDelegate
    func didPressButton(sender:UIButton,atIndex:Int){
        let tabInfo = tabBarInfos[atIndex]
        let selectedViewController = tabInfo.contentController
        
        self.replaceSelectViewController(selectedViewController, button: sender)
    }
    
    // MARK: View Controller Selection
    func replaceSelectViewController(viewController:UIViewController,button:UIButton){
        self.tabBarViewController.replaceSelectedButton(button,tabBarInfos:tabBarInfos)
        self.selectViewController(viewController)
    }
    
    func selectViewController(viewController:UIViewController){
        self.presentationView.removeAllSubViews()
        self.presentationView.addSubview(viewController.view)
    }
    
}