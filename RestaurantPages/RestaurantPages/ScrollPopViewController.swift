//
//  ScrollPopViewController.swift
//  RestaurantPages
//
//  Created by djzhang on 6/5/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit

class ScrollPopViewController: UIViewController {
    
    @IBOutlet weak var scrollContainer: UIView!
    
    lazy var scrollView:PanGestureScrollView = {
        var view = PanGestureScrollView()
        view.scrollHorizontal = true
        view.scrollVertical = false
        return view
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.scrollContainer.addSubview(self.scrollView)
        self.scrollView.backgroundColor = UIColor.redColor()
        self.scrollView.LayoutFullView()
        
        self.scrollView.contentSize = CGSizeMake(1000, self.scrollContainer.frame.size.height)
        self.setupScrollItems()
    }
    
    func setupScrollItems(){
        var viewController = RecipePhotoViewController.instance()
        self.scrollView.addSubview(viewController.view)
        viewController.view.LayoutFullView()
        viewController.configureCell(1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func zoomButtonTap(sender: AnyObject) {
        
        
    }
    
    

}
