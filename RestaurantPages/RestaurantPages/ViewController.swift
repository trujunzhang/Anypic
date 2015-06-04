//
//  ViewController.swift
//  RestaurantPages
//
//  Created by djzhang on 6/4/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pageContainer: UIView!
    
    let pagesCollectionViewController: PagesCollectionViewController = PagesCollectionViewController.instance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.addChildViewController(self.pagesCollectionViewController)
        self.pageContainer.addSubview(self.pagesCollectionViewController.view)
        self.pagesCollectionViewController.view.LayoutFullView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

