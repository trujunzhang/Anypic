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
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    
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

    @IBAction func moveTapped(sender: AnyObject) {
        let last = self.heightConstraint.constant
        self.heightConstraint.constant = last + 20
        
        self.pagesCollectionViewController.collectionView?.reloadData()
    }
    
    
    
    //        CGFloat new_size;
    //        if (self.pinchRecognizer.scale < 1.0) {
    //            new_size = self.frame.size.width + (self.pinchRecognizer.velocity / self.pinchRecognizer.scale);
    //        } else {
    //
    //            new_size = self.frame.size.width + self.pinchRecognizer.velocity;
    //        }
    //
    //        CGFloat delta = (self.frame.size.width - new_size)/2;
    //        self.frame = CGRectMake(self.frame.origin.x + delta, self.frame.origin.y + delta, new_size, new_size);
    
    
    // MARK: Pinch gesture recognizer for CollectionView
    @IBAction func handlePinch(recognizer: UIPinchGestureRecognizer) {
        var new_size:CGFloat
        if(recognizer.scale < 1.0){
            new_size = recognizer.velocity/recognizer.scale
        }else{
            new_size = recognizer.velocity
        }
        //        var delta:CGFloat = new_size
        
        println("scale is \(recognizer.scale), velocity is \(recognizer.velocity)")
    }

    

}

