//
//  CatApp.m
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/14/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import "CatApp.h"
#import "CatViewController.h"
#import "GDMenuItem.h"
#import "GDRoute.h"

@implementation CatApp

+ (UINavigationController *)baseNavigationController
{
	return [[UINavigationController alloc] initWithRootViewController:[[CatViewController alloc] init]];
}

+ (NSArray *)menuItems
{
	GDMenuItem *menuItem = [[GDMenuItem alloc] initWithTitle:@"CATS" iconImageName:@"" appClass:[CatViewController class]];
	return @[menuItem];
}

+ (NSDictionary *)routesToRegister
{
	GDRoute *route = [GDRoute routeWithURLString:@"/catviewcontroller" andAction: ^BOOL (id <GDRoutingDelegate> routingDelegate, NSString *urlString, NSDictionary *parameters) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CatViewController *catController = [storyboard instantiateViewControllerWithIdentifier:@"CatViewController"];
        [routingDelegate pushRoutedViewController:catController animated:YES parameters:nil];
        
	    return YES;
	}];
    
    NSDictionary *routeDictionary = @{@"catviewcontroller" : route};
	return routeDictionary;
}


@end
