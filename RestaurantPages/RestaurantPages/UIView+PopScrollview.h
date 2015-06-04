//
//  UIView+PopScrollview.h
//  RestaurantPages
//
//  Created by djzhang on 6/4/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class POPAnimatableProperty;

@interface UIView (PopScrollView)

- (void)decayAnimationPopWithVelocity:(CGPoint)velocity;

- (POPAnimatableProperty *)boundsOriginProperty;

- (void)removePopAnimationForKey:(NSString *)key;

- (BOOL)checkDecayAnimationVelocity;

- (id)getDecayAnimationVelocity;
@end
