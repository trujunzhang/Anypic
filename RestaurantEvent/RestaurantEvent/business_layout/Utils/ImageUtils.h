//
//  ImageUtils.h
//  RestaurantEventBDD
//
//  Created by djzhang on 5/29/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UploadImageInfo : NSObject
@property(nonatomic, strong) NSData *imageData;
@property(nonatomic, strong) NSData *thumbnailImageData;
@end

@interface ImageUtils : NSObject
+ (UploadImageInfo *)prepareImageToStandard:(UIImage *)anImage;
@end
