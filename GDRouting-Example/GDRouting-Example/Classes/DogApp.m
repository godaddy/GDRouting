//
//  DogApp.m
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/14/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import "DogApp.h"
#import "GDMenuItem.h"
#import "GDRoute.h"
#import "DogViewController.h"

@implementation DogApp

+ (UINavigationController *)baseNavigationController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DogViewController *dogController = [storyboard instantiateViewControllerWithIdentifier:@"DogViewController"];
	return [[UINavigationController alloc] initWithRootViewController:dogController];
}

+ (NSArray *)menuItems
{
	GDMenuItem *menuItem = [[GDMenuItem alloc] initWithTitle:@"DOGS" iconImageName:@""];
	return @[menuItem];
}

+ (NSDictionary *)routesToRegister
{
	GDRoute *route = [GDRoute routeWithURLString:@"/dogviewcontroller" andAction: ^BOOL (id <GDRoutingDelegate> routingDelegate, NSString *urlString, NSDictionary *parameters) {

        UINavigationController *navController = [DogApp baseNavigationController];
	    [routingDelegate presentRoutedViewController:navController animated:YES parameters:nil];
	    return YES;
	}];
    
    NSDictionary *routeDictionary = @{@"dogviewcontroller" : route};
	return routeDictionary;
}


@end
