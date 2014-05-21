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
static NSString *const MoarDogViewControllerIdentifier = @"MoarDogViewController";
static NSString *const MenuItemTitle = @"DOGS";
static NSString *const MoarMenuItemTitle = @"MOAR DOGS";
static NSString *const SectionTitle = @"WOOF";

+ (UINavigationController *)baseNavigationController
{
	return [[UINavigationController alloc] initWithRootViewController:[UIStoryboard instantiateViewControllerWithIdentifier:ViewControllerIdentifier andStoryboardName:StoryboardName]];
}

+ (NSArray *)menuItems
{
	GDMenuItem *menuItem = [[GDMenuItem alloc] initWithTitle:MenuItemTitle andDisplayOrder:0];
    menuItem.sectionTitle = SectionTitle;
    GDMenuItem *secondItem = [[GDMenuItem alloc] initWithTitle:MoarMenuItemTitle andDisplayOrder:1];
	return @[secondItem, menuItem];
}

+ (NSDictionary *)routesToRegister
{
	GDRoute *route = [GDRoute routeWithURLString:[NSString stringWithFormat:@"/%@", ViewControllerIdentifier] andDisplayOrder:0 andAction: ^BOOL (id <GDRoutingDelegate> routingDelegate, NSString *urlString, NSDictionary *parameters) {
        UINavigationController *navController = [DogApp baseNavigationController];
	    [routingDelegate presentRoutedViewController:navController animated:YES parameters:nil];
	    return YES;
	}];
    
    GDRoute *secondRoute = [GDRoute routeWithURLString:[NSString stringWithFormat:@"/%@", MoarDogViewControllerIdentifier] andDisplayOrder:1 andAction: ^BOOL (id <GDRoutingDelegate> routingDelegate, NSString *urlString, NSDictionary *parameters) {
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[UIStoryboard instantiateViewControllerWithIdentifier:MoarDogViewControllerIdentifier andStoryboardName:StoryboardName]];
	    [routingDelegate presentRoutedViewController:navController animated:YES parameters:nil];
	    return YES;
	}];

    NSDictionary *routeDictionary = @{ViewControllerIdentifier : route, MoarDogViewControllerIdentifier : secondRoute};
	return routeDictionary;
}

@end
