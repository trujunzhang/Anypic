//
//  UIViewExtentions.swift
//
//  Created by Taro Minowa on 6/9/14.
//  Copyright (c) 2014 Higepon Taro Minowa. All rights reserved.
//

import UIKit
import Cartography

extension UIView {
    func centerHorizontally(parentWidth: CGFloat) {
        let centerX = CGFloat(floor(Double(CGFloat(parentWidth - frame.size.width) / CGFloat(2.0))))
        self.frame = CGRect(x:centerX, y:frame.origin.y, width:frame.size.width, height:frame.size.height)
    }
    
    func removeAllSubViews(){
        let subviews:[AnyObject] =  self.subviews
        for subview in subviews{
            subview.removeFromSuperview()
        }
    }
    
    
    /**
    AutoLayout: full superview
    */
    func LayoutFullView() {
        layout(self) {
            view1 in
            
            view1.centerX == view1.superview!.centerX
            view1.centerY == view1.superview!.centerY
            
            view1.width == view1.superview!.width
            view1.height == view1.superview!.height
        }
    }
    
    func LayoutCenter() {
        layout(self) {
            view in
            
            view.size   == view.size
            view.center == view.superview!.center
        }
    }
    
    class func LayoutDivideTheSameWidth(view1:UIView,view2:UIView,view3:UIView){
        layout(view1,view2,view3) {
            view1,view2,view3 in
            
            view1.leading == view1.superview!.leading
            view1.centerY == view1.superview!.centerY
            view1.width   == view1.superview!.width/3
            view1.height  == view1.superview!.height
            
            view2.leading == view1.superview!.trailing
            view2.centerY == view2.superview!.centerY
            view2.width   == view2.superview!.width/3
            view2.height  == view2.superview!.height
            
            //            view3.leading == view2.superview!.trailing
            //            view3.centerY == view3.superview!.centerY
            //            view3.width   == view3.superview!.width/3
            //            view3.height  == view3.superview!.height
            
        }
    }
    
    /**
    ||--------------------------------------||
    ||-------------- * self * --------------||
    ||--------------------------------------||
    ||---------- * relatedView * -----------||
    ||--------------------------------------||
    
    :param: relatedView relatedView instance
    :param: height      self's height
    */
    func LayoutTopRelatedView(relatedView:UIView,height: CGFloat) {
        layout(self,relatedView) {
            view1,view2 in
            
            view1.centerX == view1.superview!.centerX
            view1.width == view1.superview!.width
            view1.height == height
            view1.top == view1.superview!.top
            
            view2.centerX == view1.centerX
            view2.width == view2.superview!.width
            view2.top == view1.bottom
            view2.bottom == view2.superview!.bottom
        }
    }
    
    /**
    ||--------------------------------------||
    ||---------- * relatedView * -----------||
    ||--------------------------------------||
    ||-------------- * self * --------------||
    ||--------------------------------------||
    
    :param: relatedView relatedView instance
    :param: height      relatedView's height
    */
    func LayoutBottomRelatedView(relatedView:UIView,height: CGFloat) {
        layout(relatedView,self) {
            view1,view2 in
            
            view1.centerX == view1.superview!.centerX
            view1.width == view1.superview!.width
            view1.height == height
            view1.top == view1.superview!.top
            
            view2.centerX == view1.centerX
            view2.width == view2.superview!.width
            view2.top == view1.bottom
            view2.bottom == view2.superview!.bottom
        }
    }
    
    
    
    /**
    AutoLayout for margining self
    
    :param: edge
    */
    func LayoutMargining(edge: UIEdgeInsets) {
        layout(self) {
            view1 in
            
            view1.leading == view1.superview!.leading + edge.left
            view1.trailing == view1.superview!.trailing - edge.right
            
            view1.top == view1.superview!.top + edge.top
            view1.bottom == view1.superview!.bottom - edge.bottom
        }
    }
    
    func layoutPanelTopMarginAndHeight(topMargin: CGFloat,height:CGFloat){
        layout(self) {
            view1 in
            
            view1.centerX == view1.superview!.centerX
            view1.width == view1.superview!.width
            
            view1.top == view1.superview!.top + topMargin
            view1.height == height
        }
    }
    
    func layoutPanelBottomMargin(height:CGFloat){
        layout(self) {
            view1 in
            
            view1.leading == view1.superview!.leading
            view1.trailing == view1.superview!.trailing
            
            view1.bottom == view1.superview!.bottom
            
            view1.height == height
        }
    }
}
