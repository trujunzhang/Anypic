//
//  UIView+PopScrollview.m
//  RestaurantPages
//
//  Created by djzhang on 6/4/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import <pop/POP.h>
#import "UIView+PopScrollView.h"

#import "pop/POP.h"

@implementation UIView (PopScrollView)


- (void)decayAnimationPopWithVelocity:(CGPoint)velocity {
    POPDecayAnimation *decayAnimation = [POPDecayAnimation animation];
    decayAnimation.property = [self boundsOriginProperty];
    decayAnimation.velocity = [NSValue valueWithCGPoint:velocity];
    [self pop_addAnimation:decayAnimation forKey:@"decelerate"];
}


- (POPAnimatableProperty *)boundsOriginProperty {
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"com.rounak.bounds.origin" initializer:^(POPMutableAnimatableProperty *prop) {
        // read value
        prop.readBlock = ^(id obj, CGFloat values[]) {
            values[0] = [obj bounds].origin.x;
            values[1] = [obj bounds].origin.y;
        };
        // write value
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            CGRect tempBounds = [obj bounds];
            tempBounds.origin.x = values[0];
            tempBounds.origin.y = values[1];
            [obj setBounds:tempBounds];
        };
        // dynamics threshold
        prop.threshold = 0.01;
    }];

    return prop;
}

- (void)removePopAnimationForKey:(NSString *)key {
    [self pop_removeAnimationForKey:key];
}

- (BOOL)checkDecayAnimationVelocity {
    return [self pop_animationForKey:@"decelerate"] != nil;
}

- (id)getDecayAnimationVelocity {
    POPDecayAnimation *decayAnimation = [self pop_animationForKey:@"decelerate"];

    return decayAnimation.velocity;
}


@end
