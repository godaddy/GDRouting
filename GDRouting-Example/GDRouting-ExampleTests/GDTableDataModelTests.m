//
//  GDTableDataModelTests.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GDTableDataModel.h"

@interface GDTableDataModelTests : XCTestCase

@end

@implementation GDTableDataModelTests

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

- (void)testTableDataModelInitialization
{
    GDTableDataModel *model = [[GDTableDataModel alloc] init];
    XCTAssertNotNil(model.dataArray, @"Data array is nil");
    XCTAssertNotNil(model.headerArray, @"Header array is nil");
}

- (void)testTableDataModelInitializationWithParameters
{
    NSArray *dataArray = @[@(1)];
    NSArray *headerArray = @[@(2)];
    GDTableDataModel *model = [[GDTableDataModel alloc] initWithDataArray:dataArray andHeaderArray:headerArray];
    
    XCTAssertEqual(dataArray.count, model.dataArray.count, @"Data Arrays do not have the correct count");
    XCTAssertEqual(headerArray.count, model.headerArray.count, @"Header Arrays do not have the correct count");
    XCTAssertEqual([dataArray[0] intValue], [model.dataArray[0] intValue], @"Data Array values are not equal");
}

- (void)testObjectFetching
{
    NSArray *rowArray = @[@(1), @(2), @(3)];
    GDTableDataModel *model = [[GDTableDataModel alloc] initWithDataArray:@[rowArray] andHeaderArray:nil];
    NSNumber *number = [model objectInDataArrayAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    XCTAssertEqual([rowArray[0] integerValue], [number integerValue], @"objectInDataArrayAtIndexPath didn't return the correct object.");
    
    number = [model objectInDataArrayAtIndexPath:[NSIndexPath indexPathForItem:3 inSection:0]];
    XCTAssertNil(number, @"objectInDataArrayAtIndexPath should have returned nil");
    
    number = [model objectInDataArrayAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:2]];
    XCTAssertNil(number, @"objectInDataArrayAtIndexPath should have returned nil");
}

- (void)testHeaderFetching
{
    NSArray *rowArray = @[@(1), @(2), @(3)];
    GDTableDataModel *model = [[GDTableDataModel alloc] initWithDataArray:nil andHeaderArray:@[rowArray]];
    
    NSNumber *number = [model objectInHeaderArrayAtPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    XCTAssertEqual([rowArray[0] integerValue], [number integerValue], @"objectInHeaderArrayAtPath didn't return the correct object.");
    
    number = [model objectInHeaderArrayAtPath:[NSIndexPath indexPathForItem:3 inSection:0]];
    XCTAssertNil(number, @"objectInHeaderArrayAtPath should have returned nil");
    
    number = [model objectInHeaderArrayAtPath:[NSIndexPath indexPathForItem:0 inSection:2]];
    XCTAssertNil(number, @"objectInHeaderArrayAtPath should have returned nil");
}
@end
