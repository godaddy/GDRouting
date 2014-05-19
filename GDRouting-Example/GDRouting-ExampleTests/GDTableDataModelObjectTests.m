//
//  GDTableDataModelObjectTests.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GDTableDataModelObject.h"

@interface GDTableDataModelObjectTests : XCTestCase

@end

@implementation GDTableDataModelObjectTests

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

- (void)testTableDataModelInit
{
    GDTableDataModelObject *object = [[GDTableDataModelObject alloc] init];
    XCTAssertNotNil(object.parameterDictionary, @"Parameter dictionary is nil");
}

- (void)testTableDataModelInitWithDictonary
{
    NSDictionary *dictionary = @{@"test" : @"test"};
    GDTableDataModelObject *object = [[GDTableDataModelObject alloc] initWithParameterDictionary:dictionary];
    
    XCTAssertNotNil(object.parameterDictionary, @"Parameter dictionary is nil");
    XCTAssertTrue(object.parameterDictionary.count == 1, @"Parameter dictionary is empty");
    
    GDTableDataModelSelectedBlock selectedBlock = ^BOOL(NSDictionary *parameters){
        return YES;
    };
    
    object.selectedBlock = selectedBlock;
    
    XCTAssertTrue(selectedBlock(nil), @"Block didn't execute correctly");
}

- (void)testTableDataModelInitWithDictonaryAndSelectedBlock
{
    NSDictionary *dictionary = @{@"test" : @"test"};
    GDTableDataModelSelectedBlock selectedBlock = ^BOOL(NSDictionary *parameters){
        return YES;
    };
    
    GDTableDataModelObject *object = [[GDTableDataModelObject alloc] initWithParameterDictionary:dictionary andSelectedBlock:selectedBlock];
    
    XCTAssertNotNil(object.parameterDictionary, @"Parameter dictionary is nil");
    XCTAssertTrue(object.parameterDictionary.count == 1, @"Parameter dictionary is empty");
    XCTAssertTrue(selectedBlock(nil), @"Block didn't execute correctly");
}

@end
