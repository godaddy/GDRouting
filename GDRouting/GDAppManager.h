//
//  GDAppManager.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDRoute.h"

@interface GDAppManager : NSObject

@property(nonatomic, strong, readonly) NSArray *usableAppArray;

- (instancetype)initWithUsableAppArray:(NSArray *)inUsableAppArray;
- (NSArray *)getGDMenuItemsForApps;
- (NSArray *)getGDRouteArrayForApps;
- (NSDictionary *)getGDRouteDictionaryForApps;
- (BOOL)registerRoutesForAppsWithRoutingDelegate:(id<GDRoutingDelegate>)inDelegate;


@end
