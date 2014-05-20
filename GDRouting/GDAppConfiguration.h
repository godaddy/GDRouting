//
//  GDAppConfiguration.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/7/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDArchiving.h"

/**
 *  GDAppConfiguration is an archivable object used to store configuration information about the app. We plan on 
 */
@interface GDAppConfiguration : NSObject <GDArchiving>

/**
 *  Returns an array of GDUsableApp objects for use in GDAppManager to configure GDRoutes and GDMenuItems.
 */
@property(strong, nonatomic) NSArray *usableAppArray;

/**
 *  Grabs the CFBundleURLSchemes from the info.plist for use creating an x-callback-url link to one of the configured sub applications.
 */
@property(strong, nonatomic) NSString *baseCallbackURLString;

@end
