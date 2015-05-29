//
//  ImageUtils.m
//  RestaurantEventBDD
//
//  Created by djzhang on 5/29/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import "ImageUtils.h"
#import "UIImage+ResizeAdditions.h"

@implementation UploadImageInfo
@end

@implementation ImageUtils

+ (UploadImageInfo *)prepareImageToStandard:(UIImage *)anImage {
    UIImage *resizedImage = [anImage resizedImageWithContentMode:UIViewContentModeScaleAspectFit bounds:CGSizeMake(560.0f, 560.0f) interpolationQuality:kCGInterpolationHigh];
    UIImage *thumbnailImage = [anImage thumbnailImage:86.0f transparentBorder:0.0f cornerRadius:10.0f interpolationQuality:kCGInterpolationDefault];

    UploadImageInfo *info = [[UploadImageInfo alloc] init];

    // JPEG to decrease file size and enable faster uploads & downloads
    info.imageData = UIImageJPEGRepresentation(resizedImage, 0.8f);
    info.thumbnailImageData = UIImagePNGRepresentation(thumbnailImage);

    return info;
}

@end
