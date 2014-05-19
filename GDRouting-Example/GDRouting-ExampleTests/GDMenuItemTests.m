//
//  GDDiscovery_Shared_ExampleTests.m
//  GDRouting-ExampleTests
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GDMenuItem.h"
#import "GDRoute.h"

@interface GDMenuItemTests : XCTestCase

@end

@implementation GDMenuItemTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testCreateMenuItem
{
    NSString *testTitle = @"TestTitle";
    NSString *iconName = @"IconName";
    NSString *sectionTitle = @"SectionTitle";
    Class appClass = [GDMenuItem class];
    GDMenuItem *item = [[GDMenuItem alloc] initWithTitle:testTitle iconImageName:iconName appClass:appClass];
    item.sectionTitle = sectionTitle;
    
    XCTAssertTrue([testTitle isEqualToString:item.title], @"Title is not set correctly");
    XCTAssertTrue([iconName isEqualToString:item.iconImageName], @"Icon name is not set correctly");
    XCTAssertTrue([sectionTitle isEqualToString:item.sectionTitle], @"Section title name is not set correctly");
    XCTAssertEqual(appClass, item.appClass, @"App class is not set correctly");
}

@end
