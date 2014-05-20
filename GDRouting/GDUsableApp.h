//
//  GDUsableApps.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/7/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  A GDUsableApp is a representation of an sub-app that is configured for use in your main application
 */
@interface GDUsableApp : NSObject

/**
 *  Name of your sub-app. Should match the sub-app class exactly
 */
@property(nonatomic, strong) NSString *appName;

/**
 *  Order the sub-app's menu items should be listed in the menu.
 */
@property(nonatomic) NSInteger displayOrder;

@end
