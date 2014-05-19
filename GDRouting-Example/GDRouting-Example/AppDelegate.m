//
//  AppDelegate.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
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
    
    MainMenuViewController *mainMenuController = [MainMenuViewController mainMenuViewControllerFromStoryboard];
    
    self.navController = (UINavigationController *)self.window.rootViewController;
    
    TheSidebarController *sidebarController = [[TheSidebarController alloc] initWithContentViewController:self.navController leftSidebarViewController:mainMenuController];
    self.window.rootViewController = sidebarController;
    
    GDAppManager *appManager = [[GDAppManager alloc] initWithUsableAppArray:appConfiguration.usableAppArray];
    [appManager registerRoutesForAppsWithRoutingDelegate:self];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
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
