//
//  AppDelegate.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "GDAppConfiguration.h"
#import "GDUsableApp.h"
#import "MainMenuViewController.h"
#import "GDAppManager.h"
#import "JLRoutes.h"
#import "TheSidebarController.h"

@interface AppDelegate()

@property(nonatomic, strong) UINavigationController *navController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /**
     *  Create the GDAppConfiguration object, configure it with sub-apps and archive it
     */
    GDAppConfiguration *appConfiguration = [[GDAppConfiguration alloc] init];
    
    GDUsableApp *manateeApp = [[GDUsableApp alloc] init];
    manateeApp.displayOrder = 0;
    manateeApp.appName = @"ManateeApp";
    
    GDUsableApp *catApp = [[GDUsableApp alloc] init];
    catApp.displayOrder = 0;
    catApp.appName = @"CatApp";
    
    GDUsableApp *dogApp = [[GDUsableApp alloc] init];
    dogApp.displayOrder = 0;
    dogApp.appName = @"DogApp";
    
    
    
    appConfiguration.usableAppArray = @[manateeApp, catApp, dogApp];
    [appConfiguration archiveObject];
    
    /**
     *  Set up the TheSidebarController and set up our views
     */
    MainMenuViewController *mainMenuController = [MainMenuViewController mainMenuViewControllerFromStoryboard];
    
    self.navController = (UINavigationController *)self.window.rootViewController;
    
    TheSidebarController *sidebarController = [[TheSidebarController alloc] initWithContentViewController:self.navController leftSidebarViewController:mainMenuController];
    self.window.rootViewController = sidebarController;
    
    /**
     *  Create an instance of GDAppManager and register our routes
     */
    GDAppManager *appManager = [[GDAppManager alloc] initWithUsableAppArray:appConfiguration.usableAppArray];
    [appManager registerRoutesForAppsWithRoutingDelegate:self];
    
    return YES;
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [JLRoutes routeURL:url];
}


#pragma mark - GDRoutingDelegate methods

-(void) pushRoutedViewController:(UIViewController *)viewController animated:(BOOL)animated parameters:(NSDictionary *)parameters
{
    [self.navController pushViewController:viewController animated:animated];
}


-(void) presentRoutedViewController:(UIViewController *)viewController animated:(BOOL)animated parameters:(NSDictionary *)parameters
{
    [self.navController presentViewController:viewController animated:animated completion:nil];
}

-(void) popRoutedViewController:(BOOL)animated parameters:(NSDictionary *)parameters
{
    [self.navController popViewControllerAnimated:animated];
}

-(void) popRoutedViewControllerToRootViewController:(BOOL)animated parameters:(NSDictionary *)parameters
{
    [self.navController popToRootViewControllerAnimated:animated];
}

@end
