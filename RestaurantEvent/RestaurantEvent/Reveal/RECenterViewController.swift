//
//  RECenterViewController.swift
//  RestaurantEvent
//
//  Created by djzhang on 5/28/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class RECenterViewController: UIViewController,TabBarItemDelegate{
    
    let tabBarViewController: RETabBarViewController = RETabBarViewController.instance()
    
    lazy var presentationView:UIView = { return UIView() }()
    lazy var tabBarInfos:[TabBarInfo] =  { return RETabBarGenerator.generateTabBarInfos() }()
    
    var lastViewController:UIViewController?
    
    //MARK: UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Restaurant"
        self.edgesForExtendedLayout = .None

        // Add Presentation view.
        self.view.addSubview(self.presentationView)
        
        // Add tabbar view.
        self.addChildViewController(self.tabBarViewController)
        self.view.addSubview(self.tabBarViewController.view)
        
        // Layout all views here.
        self.tabBarViewController.view.LayoutBottomRelatedView(self.presentationView,height:50)
        self.tabBarViewController.layoutViewController(tabBarInfos,delegate:self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Show first tabBar item and it's presentation.
        self.tabBarViewController.showTabBarButton(TabBarType.Home.hashValue)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    // MARK: TabBarItemDelegate
    func didPressButton(sender:UIButton,atIndex:Int){
        let selectedViewController = tabBarInfos[atIndex].contentController
        
        self.replaceSelectViewController(selectedViewController, button: sender)
    }
    
    // MARK: View Controller Selection
    func replaceSelectViewController(viewController:UIViewController,button:UIButton){
        self.tabBarViewController.replaceSelectedButton(button,tabBarInfos:tabBarInfos)
        self.selectViewController(viewController)
    }
    
    func selectViewController(viewController:UIViewController){
        // First,clean up last sub views
        self.presentationView.removeAllSubViews()
        if let theLastViewController = self.lastViewController{
            theLastViewController.removeFromParentViewController()
        }
        self.lastViewController = viewController

        self.addChildViewController(viewController)
        self.presentationView.addSubview(viewController.view)
        viewController.view.LayoutFullView()
    }
    
}