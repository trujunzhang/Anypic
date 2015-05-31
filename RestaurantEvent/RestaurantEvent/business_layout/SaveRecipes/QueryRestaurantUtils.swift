//
//  QueryRestaurantUtils.swift
//  RestaurantEventBDD
//
//  Created by djzhang on 5/30/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation


class QueryRestaurantUtils {
    
    class func query() -> PFQuery{
        
        var query = PFQuery(className: kPAPRestaurantClassKey)
        query.whereKey(kPAPRestaurantUserKey, equalTo: PFUser.currentUser()!)
        //        query.orderByAscending(PF_USER_FULLNAME)
        query.limit = 1000
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                let array:NSArray = objects!
                self.printObject(array as! [PFObject])
            } else {
            }
        }
        
        return query
    }
    
    class func update(){
        
    }
    
    class func deletePhoto(){
        
    }
    
    class func addPhoto(){
        
    }
    
    class func printObject(objects:[PFObject]){
        let count =  objects.count
        for object in objects{
            let id =     object.objectId
            let array:[PFObject] = object.valueForKey("photos") as! [PFObject]
            for photo in array {
                let photoId =     photo.objectId
                let y = 0
            }
            let x = 0
        }
        
    }
    
}