//
//  MainMenuApp.m
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/7/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "ManateeApp.h"
#import "ManateeViewController.h"
#import "GDMenuItem.h"
#import "GDRoute.h"

@implementation ManateeApp

+ (UINavigationController *)baseNavigationController
{
	return [[UINavigationController alloc] initWithRootViewController:[[ManateeViewController alloc] init]];
}

+ (NSArray *)menuItems
{
	GDMenuItem *manateeItem = [[GDMenuItem alloc] initWithTitle:@"MANATEES" iconImageName:@""];
	return @[manateeItem];
}

+ (NSDictionary *)routesToRegister
{
	GDRoute *route = [GDRoute routeWithURLString:@"/manateeviewcontroller" andAction: ^BOOL (id <GDRoutingDelegate> routingDelegate, NSString *urlString, NSDictionary *parameters) {
	    [routingDelegate popRoutedViewControllerToRootViewController:YES parameters:nil];
	    return YES;
	}];

    NSDictionary *routeDictionary = @{@"manateeviewcontroller" : route};
	return routeDictionary;
}

@end
