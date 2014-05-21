//
//  DogApp.m
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/14/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "DogApp.h"
#import "GDMenuItem.h"
#import "GDRoute.h"
#import "DogViewController.h"
#import "UIStoryboard+QuickFetch.h"

@implementation DogApp

static NSString *const StoryboardName = @"Main";
static NSString *const ViewControllerIdentifier = @"DogViewController";
static NSString *const MenuItemTitle = @"DOGS";

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
        UINavigationController *navController = [DogApp baseNavigationController];
	    [routingDelegate presentRoutedViewController:navController animated:YES parameters:nil];
	    return YES;
	}];
    
    NSDictionary *routeDictionary = @{ViewControllerIdentifier : route};
	return routeDictionary;
}

@end
