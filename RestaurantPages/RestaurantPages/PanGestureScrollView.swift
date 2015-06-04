//
//  PanGestureScrollView.swift
//  RestaurantPages
//
//  Created by djzhang on 6/4/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation
import UIKit

class PanGestureScrollView: UIView {
    var contentSize: CGSize?
    var scrollVertical:Bool?
    var scrollHorizontal:Bool?
    
    var startBounds:CGRect?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
super.init(coder: aDecoder)
    }
    
    func commonInitForCustomScrollView(){
        self.scrollHorizontal = true
        self.scrollVertical = true
        
        let panGestureRecognizer:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        self.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    
    
    
}