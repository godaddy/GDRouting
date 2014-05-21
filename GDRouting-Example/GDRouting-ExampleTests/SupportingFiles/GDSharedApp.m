//
//  GDSharedApp.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "GDSharedApp.h"
#import "GDMenuItem.h"
#import "GDRoute.h"
#import "ManateeViewController.h"

@implementation GDSharedApp

+ (UINavigationController *)baseNavigationController
{
	return [[UINavigationController alloc] initWithRootViewController:[[ManateeViewController alloc] init]];
}

+ (NSArray *)menuItems
{
	GDMenuItem *viewControllerItem = [[GDMenuItem alloc] initWithTitle:@"SharedApp" andDisplayOrder:0 andIconImageName:@""];
	return @[viewControllerItem];
}

+ (NSDictionary *)routesToRegister
{
	GDRoute *route = [GDRoute routeWithURLString:@"/sharedapp" andAction: ^BOOL (id <GDRoutingDelegate> routingDelegate, NSString *urlString, NSDictionary *parameters) {
	    [routingDelegate popRoutedViewControllerToRootViewController:YES parameters:nil];
	    return YES;
	}];
	NSDictionary *routes = @{@"sharedapp" : route};
    
	return routes;
}


@end
