//
//  GDAppManagerTests.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GDAppManager.h"
#import "GDUsableApp.h"

@interface GDAppManagerTests : XCTestCase

@end

@implementation GDAppManagerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetMenuItems
{
    GDUsableApp *usableApp = [[GDUsableApp alloc] init];
    usableApp.appName = @"GDSharedApp";
    usableApp.displayOrder = 0;
    GDAppManager *appManager = [[GDAppManager alloc] initWithUsableAppArray:@[usableApp]];
    NSArray *menuItemArray = [appManager getGDMenuItemsForApps];
    XCTAssertTrue(menuItemArray.count > 0, @"MenuItemArray count is 0");
}

- (void)testGetRouteArray
{
    GDUsableApp *usableApp = [[GDUsableApp alloc] init];
    usableApp.appName = @"GDSharedApp";
    usableApp.displayOrder = 0;
    GDAppManager *appManager = [[GDAppManager alloc] initWithUsableAppArray:@[usableApp]];
    NSArray *routeArray = [appManager getGDRouteArrayForApps];
    XCTAssertTrue(routeArray.count > 0, @"routeArray count is 0");
}

- (void)testRegisterRoutes
{
    GDUsableApp *usableApp = [[GDUsableApp alloc] init];
    usableApp.appName = @"GDSharedApp";
    usableApp.displayOrder = 0;
    GDAppManager *appManager = [[GDAppManager alloc] initWithUsableAppArray:@[usableApp]];
    BOOL registeredRoutes = [appManager registerRoutesForAppsWithRoutingDelegate:nil];
    XCTAssertTrue(registeredRoutes, @"Routes not registered successfully");
}
@end
