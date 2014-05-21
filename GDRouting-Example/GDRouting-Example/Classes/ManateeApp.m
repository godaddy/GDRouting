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
#import "UIStoryboard+QuickFetch.h"

@implementation ManateeApp

static NSString *const StoryboardName = @"Main";
static NSString *const ViewControllerIdentifier = @"ManateeViewController";
static NSString *const MenuItemTitle = @"MANATEES";

+ (UINavigationController *)baseNavigationController
{
	return [[UINavigationController alloc] initWithRootViewController:[UIStoryboard instantiateViewControllerWithIdentifier:ViewControllerIdentifier andStoryboardName:StoryboardName]];
}

+ (NSArray *)menuItems
{
	GDMenuItem *menuItem = [[GDMenuItem alloc] initWithTitle:MenuItemTitle iconImageName:nil];
	return @[menuItem];
}

+ (NSDictionary *)routesToRegister
{
	GDRoute *route = [GDRoute routeWithURLString:[NSString stringWithFormat:@"/%@", ViewControllerIdentifier] andAction: ^BOOL (id <GDRoutingDelegate> routingDelegate, NSString *urlString, NSDictionary *parameters) {
	    [routingDelegate popRoutedViewControllerToRootViewController:YES parameters:nil];
	    return YES;
	}];

    NSDictionary *routeDictionary = @{ViewControllerIdentifier : route};
	return routeDictionary;
}

@end
