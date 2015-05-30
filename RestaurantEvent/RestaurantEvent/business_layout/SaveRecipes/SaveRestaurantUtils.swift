//
//  SaveRestaurantUtils.swift
//  RestaurantEvent
//
//  Created by djzhang on 5/29/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation


class SaveRestaurantUtils {
    
    class func savePhoto(image:UIImage){
        let info: UploadImageInfo = ImageUtils.prepareImageToStandard(image)
        
        let photoFile: PFFile = PFFile(data:info.imageData)
        let thumbnailFile: PFFile = PFFile(data:info.thumbnailImageData)
        
        let x = 0
        
        photoFile.saveInBackgroundWithBlock({ (success, error) -> Void in
            if error == nil {
                let url = photoFile.url
                let x = 0
            } else {
                let y = 0
            }
        }, progressBlock: { (value) -> Void in
            println("\(value)")
        })
    }
    
    class func savePhotos(image:UIImage,point:PFObject){
        // create a photo object
        var photo = PFObject(className: kPAPPhotoClassKey)
        
        let info: UploadImageInfo = ImageUtils.prepareImageToStandard(image)
        
        let photoFile: PFFile = PFFile(data:info.imageData)
        let thumbnailFile: PFFile = PFFile(data:info.thumbnailImageData)
        
        photo[kPAPPhotoPictureKey] = photoFile
        photo[kPAPPhotoThumbnailKey] = thumbnailFile
        
        photo[kPAPPhotoUserKey] = PFUser.currentUser()
        
        photo[kPAPPhotoRestaurantKey] = point
        
        // photos are public, but may only be modified by the user who uploaded them
        let photoACL:PFACL = PFACL(user:PFUser.currentUser()!)
        photoACL.setPublicReadAccess(true)
        
        photo.ACL = photoACL
        
        photo.saveInBackgroundWithBlock { (success, error) -> Void in
            if error == nil {
                let x = 0
            } else {
                let y = 0
            }
        }
    }
    
    class func savePhotos(images:[UIImage],point:PFObject){
        
        for image in images{
            self.savePhotos(image,point:point)
        }
        
    }
    
    class func saveRestaurant(images:[UIImage]){
        
        var object = PFObject(className: kPAPRestaurantClassKey)
        
        object[kPAPRestaurantUserKey] = PFUser.currentUser()
        object[kPAPRestaurantNameKey] = "restaurant Name"
        object[kPAPRestaurantWaiterKey] = "some Waiter"
        object[kPAPRestaurantRecipeListKey] =
            ["2 fresh English muffins","4 eggs","4 rashers of back bacon","2 egg yolks","1 tbsp of lemon juice","g of butter","salt and pepper"]
        
        // replaced with createdAt field
        //        object["eatTime"] = [NSDate (timeIntervalSinceNow: 0)]
        object[kPAPRestaurantCostKey] = "12.00"
        object[kPAPRestaurantRemarkKey] = "Under the “RecipeBook” targets, select “Build Phases” and expand the “Link Binary with Libraries”. Click the “+” button and add the above libraries one by one."
        object[kPAPRestaurantLocationKey] = PFGeoPoint(latitude: 1.0, longitude: 2.0)
        
        
        object.saveInBackgroundWithBlock { (success, error) -> Void in
            if error == nil {
                //                let id = object.objectId
                self.savePhotos(images,point:object)
            } else {
                let y = 0
            }
        }
    }
}