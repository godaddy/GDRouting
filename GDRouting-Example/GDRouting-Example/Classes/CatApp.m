//
//  CatApp.m
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/14/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "CatApp.h"
#import "CatViewController.h"
#import "GDMenuItem.h"
#import "GDRoute.h"
#import "UIStoryboard+QuickFetch.h"

@implementation CatApp

static NSString *const StoryboardName = @"Main";
static NSString *const ViewControllerIdentifier = @"CatViewController";
static NSString *const MenuItemTitle = @"CATS";

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
        [routingDelegate pushRoutedViewController:[UIStoryboard instantiateViewControllerWithIdentifier:ViewControllerIdentifier andStoryboardName:StoryboardName] animated:YES parameters:nil];
	    return YES;
	}];
    
    NSDictionary *routeDictionary = @{ViewControllerIdentifier : route};
	return routeDictionary;
}


@end
