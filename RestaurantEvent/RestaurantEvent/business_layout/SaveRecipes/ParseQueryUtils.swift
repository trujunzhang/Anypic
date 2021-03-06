//
//  QueryRestaurantUtils.swift
//  RestaurantEventBDD
//
//  Created by djzhang on 5/30/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation
import Dollar
import Result
import Box

typealias QueryHandler = (Result<PFObject, NSError>) -> Void

class ParseQueryUtils {
    
    // MARK : Query Photo
    class func queryPhoto(photo:PFObject,completionBlock:QueryHandler){
        self.startQueryTaskForPhotoInfo(queryPhoto(photo), completionBlock: completionBlock)
    }
    
    class func queryPhoto(photo:PFObject) -> PFQuery{
        var query = PFQuery(className: kPAPPhotoClassKey)
        query.whereKey("objectId", equalTo: photo.objectId!)
        query.limit = 1000
        
        return query
    }
    
    class func startQueryTaskForPhotoInfo(query:PFQuery,completionBlock:QueryHandler){
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if let theError = error{
                completionBlock(.failure(theError))
            }else{
                let array:NSArray = objects!
                if(array.count > 0 ){
                    let photo:PFObject = array[0] as! PFObject
                    // let photoFile: PFFile = photo.valueForKey(kPAPPhotoPictureKey) as! PFFile
                    completionBlock(.success(photo))
                }
            }
        }
    }
    
    // MARK : Query restaurant
    class func queryRestaurant() -> PFQuery{
        
        var query = PFQuery(className: kPAPRestaurantClassKey)
        query.whereKey(kPAPRestaurantUserKey, equalTo: PFUser.currentUser()!)
        //        query.orderByAscending(PF_USER_FULLNAME)
        query.limit = 1000
        
        //        self.showRestaurantInfo(query)
        //        self.showPhotoInfoFromRestaurant(query)
        
        return query
    }
    
    class func showPhotoInfoFromRestaurant(query:PFQuery){
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                let array:NSArray = objects!
                if(array.count > 0 ){
                    var object:PFObject = array[0] as! PFObject
                    let photos:[PFObject] = object.valueForKey(kPAPRestaurantPhotosKey) as! [PFObject]
                    let photo:PFObject = photos[0]
                    
                    self.queryPhoto(photo) // Query photo
                    //                    let photoId = photo.valueForKey("objectId") as! String
                    //                    let photoFile: PFFile = photo.valueForKey(kPAPPhotoPictureKey) as! PFFile
                    //                    let x = 0
                }
            } else {
            }
        }
    }
    
    class func showRestaurantInfo(query:PFQuery){
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                let array:NSArray = objects!
                if(array.count > 0 ){
                    var object:PFObject = array[0] as! PFObject
                    //                    self.update(object)
                    //                                        self.deletePhotos(object)
                    //                                        self.addPhotos(object)
                }
                //                self.printObject(array as! [PFObject])
            } else {
            }
        }
    }
    
    
    
    class func update(object:PFObject){
        object[kPAPRestaurantCostKey] = "123.00"
        
        object.saveInBackgroundWithBlock { (success, error) -> Void in
            if error == nil {
                let id = object.objectId
            } else {
                let y = 0
            }
        }
    }
    
    class func deletePhotos(object:PFObject){
        var photos:[PFObject]  = object.valueForKey(kPAPRestaurantPhotosKey) as! [PFObject]
        var deletedPhoto:PFObject = photos[0]
        var newPhotos:[PFObject] =  $.remove(photos) {
            $0 == deletedPhoto
        }
        
        self.deletePhotos(object, newPhotos: newPhotos,lastPhotos:photos)
    }
    
    class func deletePhotos(object:PFObject,newPhotos:[PFObject],lastPhotos:[PFObject]){
        
        // Save last photos that not contains deleted photos
        object[kPAPRestaurantPhotosKey] = newPhotos
        
        object.saveInBackgroundWithBlock { (success, error) -> Void in
            if error == nil {
                let id = object.objectId
            } else {
                let y = 0
            }
        }
    }
    
    class func addPhotos(object:PFObject){
        let image4 = UIImage(named: "recipe04.jpg")
        
        self.addPhotos(object, images: [image4!])
    }
    
    class func addPhotos(object:PFObject,images:[UIImage]){
        var lastPhotos:[PFObject]  = object.valueForKey(kPAPRestaurantPhotosKey) as! [PFObject]
        var newPhotos:[PFObject] = [PFObject]()
        for image in images{
            let photo = SaveRestaurantUtils.getPhotoObject(image)
            newPhotos.append(photo)
            lastPhotos.append(photo)
        }
        
        // Save last photos that contains some new photos
        object[kPAPRestaurantPhotosKey] = lastPhotos
        object.saveInBackgroundWithBlock { (success, error) -> Void in
            if error == nil {
                let id = object.objectId
                SaveRestaurantUtils.saveRestautantRelatedPhotos(object,photos: newPhotos)
            } else {
                let y = 0
            }
        }
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