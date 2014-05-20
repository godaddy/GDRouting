//
//  GDBaseApp.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Protocol that should be used by all modular all sub-applications
 */
@protocol GDBaseApp <NSObject>

/**
 *  Class method that returns a UINavigationController with the main view controller of the sub-app as it's root view controller
 *
 *  @return UINavigationController with the main view controller of the sub-app as it's root view controller
 */
+ (UINavigationController *)baseNavigationController;

/**
 *  Class method that returns an array of all GDMenuItems associated with the sub-app
 *
 *  @return Array of all menuItems associated with the sub-app.
 */
+ (NSArray *)menuItems;

/**
 *  Class method that returns an array of all GDRoutes associated with the sub-app
 *
 *  @return Array of all GDRoutes associated with the sub-app
 */
+ (NSDictionary *)routesToRegister;

@end
