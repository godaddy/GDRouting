//
//  UIStoryboard+QuickFetch.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/21/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import "UIStoryboard+QuickFetch.h"

@implementation UIStoryboard (QuickFetch)

+ (UIViewController *)instantiateViewControllerWithIdentifier:(NSString *)inViewControllerIdentifier andStoryboardName:(NSString *)inStoryboardName
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:inStoryboardName bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:inViewControllerIdentifier];
    return viewController;
}

@end
