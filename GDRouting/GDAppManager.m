//
//  GDAppManager.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "GDAppManager.h"
#import "GDBaseApp.h"
#import "GDUsableApp.h"
#import "JLRoutes.h"

@implementation GDAppManager

static NSString * const SortKey = @"displayOrder";

- (instancetype)initWithUsableAppArray:(NSArray *)inUsableAppArray
{
    self = [super init];
    if (self)
    {
        _usableAppArray = inUsableAppArray != nil ? [[NSArray alloc] initWithArray:inUsableAppArray] : [[NSArray alloc] init];
    }
    return self;
}

- (NSArray *)getGDMenuItemsForApps
{
    NSMutableArray *allMenuItemArray= [[NSMutableArray alloc] init];
    for( GDUsableApp *usableApp in self.usableAppArray )
    {
        Class appClass = NSClassFromString(usableApp.appName);
        if( [appClass conformsToProtocol:@protocol(GDBaseApp)])
        {
            NSArray *menuItemArray = [appClass performSelector:@selector(menuItems)];
            if( menuItemArray != nil )
            {
                NSSortDescriptor *sortDescriptior = [[NSSortDescriptor alloc] initWithKey:SortKey ascending:YES];
                NSArray *sortedItems = [menuItemArray sortedArrayUsingDescriptors:@[sortDescriptior]];
                [allMenuItemArray addObjectsFromArray:sortedItems];
            }
        }
    }
    return allMenuItemArray;
}

- (NSArray *)getGDRouteArrayForApps
{
    NSDictionary *routeDictionary  = [self getGDRouteDictionaryForApps];
    return [routeDictionary allValues];
}

- (NSDictionary *)getGDRouteDictionaryForApps
{
    NSMutableDictionary *allRouteDictionary = [[NSMutableDictionary alloc] init];
    for( GDUsableApp *usableApp in self.usableAppArray )
    {
        Class appClass = NSClassFromString(usableApp.appName);
        if( [appClass conformsToProtocol:@protocol(GDBaseApp)])
        {
            NSDictionary *routeDictionary = [appClass performSelector:@selector(routesToRegister)];
            
            if( routeDictionary != nil )
            {
                [allRouteDictionary addEntriesFromDictionary:routeDictionary];
            }
        }
    }
    return allRouteDictionary;
}

- (BOOL)registerRoutesForAppsWithRoutingDelegate:(id<GDRoutingDelegate>)inDelegate
{
    BOOL registeredRoutes = NO;
    NSArray *gdroutes = [self getGDRouteArrayForApps];
    for( GDRoute *route in gdroutes )
    {
        [JLRoutes addRoute:route.urlString handler:^BOOL(NSDictionary *parameters) {
            return route.routingBlock(inDelegate, route.urlString, parameters);
        }];
        registeredRoutes = YES;
    }
    return registeredRoutes;
}
@end
