//
//  UIStoryboard+QuickFetch.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/21/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (QuickFetch)

/**
 *  Convenience method to return a view controller from a storyboard given the storyboard name and the view controller identifier
 *
 *  @param inViewControllerIdentifier - Identifier of the view controller to return
 *  @param inStoryboardName           - Storyboard name
 *
 *  @return UIViewController instance created with passed in identifier
 */
+ (UIViewController *)instantiateViewControllerWithIdentifier:(NSString *)inViewControllerIdentifier andStoryboardName:(NSString *)inStoryboardName;

@end
