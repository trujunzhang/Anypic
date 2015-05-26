//
//  StoryboardUtils.m
//  Anypic
//
//  Created by djzhang on 5/26/15.
//
//

#import "StoryboardUtils.h"
#import "PAPLogInViewController.h"

@implementation StoryboardUtils

+ (PAPLogInViewController *)getPAPLogInViewController {
    return [[UIStoryboard storyboardWithName:@"main" bundle:nil] instantiateViewControllerWithIdentifier:@"PAPLogInViewController"];
}
@end
