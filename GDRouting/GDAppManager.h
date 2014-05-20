//
//  GDAppManager.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDRoute.h"

/**
 *  GDAppManager is used to get all GDRoutes and GDMenuItems configured in the application. Also has a method to register routes with JLRoutes.
 */
@interface GDAppManager : NSObject

/**
 *  Array of GDUsableApp objects used to configure GDRoutes and GDMenuItems.
 */
@property(nonatomic, strong, readonly) NSArray *usableAppArray;

/**
 *  Constructor that takes in an array of UsableApps
 *
 *  @param inUsableAppArray - Array of UsableApps
 *
 *  @return Instance of GDAppManager
 */
- (instancetype)initWithUsableAppArray:(NSArray *)inUsableAppArray;

/**
 *  Returns an array of all GDMenuItems configured in the app
 *
 *  @return Array of all GDMenuItems configured in the app
 */
- (NSArray *)getGDMenuItemsForApps;

/**
 *  Returns an array of all GDRoutes configured in the app
 *
 *  @return Array of all GDRoutes configured in the app
 */
- (NSArray *)getGDRouteArrayForApps;

/**
 *  Returns a dictionary of all GDRoutes configured in the app. The dictionary key can be used to fetch routes they may not have associated a GDMenuItem.
 *
 *  @return NSDictionary of all GDRoutes configured in the app.
 */
- (NSDictionary *)getGDRouteDictionaryForApps;

/**
 *  Loops though all GDRoutes configured in the app and registers them with JLRoutes
 *
 *  @param inDelegate - GDRoutingDelegate delegate that is used to push/pop/present a view controller
 *
 *  @return returns YES if a route was registered, NO otherwise
 */
- (BOOL)registerRoutesForAppsWithRoutingDelegate:(id<GDRoutingDelegate>)inDelegate;


@end
