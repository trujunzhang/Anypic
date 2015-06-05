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
    var contentSize: CGSize = CGSizeZero
    var scrollVertical:Bool = false
    var scrollHorizontal:Bool = true
    
    var startBounds:CGRect = CGRectZero
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInitForCustomScrollView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInitForCustomScrollView()
    }
    
    func commonInitForCustomScrollView(){
        self.scrollHorizontal = true
        self.scrollVertical = true
        
        let panGestureRecognizer:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        self.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    func handlePanGesture(panGestureRecognizer:UIPanGestureRecognizer){
        switch(panGestureRecognizer.state){
        case .Began:
            self.removePopAnimationForKey("bounce")
            self.removePopAnimationForKey("decelerate")
            self.startBounds = self.bounds
            break;
        case .Changed:
            var translation:CGPoint = panGestureRecognizer.translationInView(self)
            var bounds: CGRect = self.startBounds
            
            if (self.scrollHorizontal == false) {
                translation.x = 0.0
            }
            if (self.scrollVertical == false) {
                translation.y = 0.0
            }
            
            let newBoundsOriginX:CGFloat   = bounds.origin.x - translation.x
            
            let minBoundsOriginX:CGFloat = 0.0
            let maxBoundsOriginX:CGFloat = self.contentSize.width - bounds.size.width
            let constrainedBoundsOriginX:CGFloat = fmax(minBoundsOriginX, fmin(newBoundsOriginX, maxBoundsOriginX))
            bounds.origin.x = constrainedBoundsOriginX + (newBoundsOriginX - constrainedBoundsOriginX) / 2
            
            let newBoundsOriginY:CGFloat = bounds.origin.y - translation.y
            let minBoundsOriginY:CGFloat = 0.0
            let maxBoundsOriginY:CGFloat = self.contentSize.height - bounds.size.height
            let constrainedBoundsOriginY:CGFloat = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY))
            bounds.origin.y = constrainedBoundsOriginY + (newBoundsOriginY - constrainedBoundsOriginY) / 2;
            
            self.bounds = bounds
            
            break;
        case .Ended:
            var velocity:CGPoint = panGestureRecognizer.velocityInView(self)
            
            if (self.scrollHorizontal == false) {
                velocity.x = 0.0
            }
            if (self.scrollVertical == false) {
                velocity.y = 0.0
            }
            
            velocity.x = -velocity.x;
            velocity.y = -velocity.y;
            //            NSLog(@"decelerating with velocity: %@", NSStringFromCGPoint(velocity));
            
            self.decayAnimationPopWithVelocity(velocity)
            break;
        default:
            break;
        }
    }
    
    
    
    
    
    
    
    
    
    
}