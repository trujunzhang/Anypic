//
//  UIViewController+TwitterPop.m
//  RestaurantPages
//
//  Created by djzhang on 6/6/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import "UIViewController+TwitterPop.h"
#import <pop/POP.h>


@implementation UIViewController(TwitterPop)


-(void)twitterPopSpring{
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animation];
    springAnimation.velocity=@(3);       // change of value units per second
    springAnimation.springBounciness=14;    // value between 0-20 default at 4
    springAnimation.springSpeed=3;     // value between 0-20 default at 4
    springAnimation.toValue = @(200);
    
    
}

- (void)pop_animationDidApply:(POPDecayAnimation *)anim
{
    BOOL isDragViewOutsideOfSuperView = YES; //!CGRectContainsRect(self.view.frame, self.dragView.frame);
    if (isDragViewOutsideOfSuperView) {
        CGPoint currentVelocity = [anim.velocity CGPointValue];
        CGPoint velocity = CGPointMake(currentVelocity.x, -currentVelocity.y);
        POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        positionAnimation.toValue = [NSValue valueWithCGPoint:self.view.center];
//        [self.dragView.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
    }
}

@end
