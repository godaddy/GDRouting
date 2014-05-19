//
//  GDAppConfigurationTests.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/7/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GDAppConfiguration.h"
#import "GDUsableApp.h"

@interface GDAppConfigurationTests : XCTestCase

@end

@implementation GDAppConfigurationTests

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

- (void)testArchiving
{
    GDAppConfiguration *appConfiguration = [[GDAppConfiguration alloc] init];
    [appConfiguration archiveObject];
    
    GDAppConfiguration *archivedConfiguration = (GDAppConfiguration *)[GDAppConfiguration readArchivedObject];
    XCTAssertNotNil(archivedConfiguration, @"GDAppConfiguration not archived correctly");
    
    [GDAppConfiguration deleteArchivedObject];
    archivedConfiguration = (GDAppConfiguration *)[GDAppConfiguration readArchivedObject];
    XCTAssertNil(archivedConfiguration, @"GDAppConfiguration not deleted correctly");
}

- (void)testUsableAppArraySort
{
    GDUsableApp *app1 = [[GDUsableApp alloc] init];
    app1.appName = @"app1";
    app1.displayOrder = 1;
    
    GDUsableApp *app0 = [[GDUsableApp alloc] init];
    app0.appName = @"app0";
    app0.displayOrder = 0;
    
    NSArray *apps = @[app1, app0];
    
    GDAppConfiguration *appConfiguration = [[GDAppConfiguration alloc] init];
    appConfiguration.usableAppArray = apps;
    
    GDUsableApp *firstApp = [appConfiguration.usableAppArray firstObject];
    XCTAssertEqual(firstApp.displayOrder, 0, @"UsableAppArray not sorted correctly");
    
}

- (void)testBaseAppURLString
{
    GDAppConfiguration *config = [[GDAppConfiguration alloc] init];
    XCTAssertTrue([config.baseCallbackURLString isEqualToString:@"gdrouting"], @"BaseURL string is wrong");
    
}

@end
