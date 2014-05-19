//
//  GDRouteTests.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GDRoute.h"

#pragma mark - dummy routing delegate
@interface DummyRoutingDelegate : NSObject <GDRoutingDelegate>

@end

@implementation DummyRoutingDelegate

-(void) pushRoutedViewController:(UIViewController *)viewController animated:(BOOL)animated parameters:(NSDictionary *)parameters
{
    
}

@end;

#pragma mark - start of tests
@interface GDRouteTests : XCTestCase

@end

@implementation GDRouteTests

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

- (void)testRouteInitialization
{
    DummyRoutingDelegate *dummyDelegate = [[DummyRoutingDelegate alloc] init];
    
    __block id <GDRoutingDelegate> blockDelegate;
    __block NSString *blockUrlString;
    __block NSDictionary *blockParameters;
    
    id <GDRoutingDelegate> initialDelegate = dummyDelegate;
    NSString *initialUrlString = @"testString";
    NSDictionary *initialParameters = @{@"testKey": @"testValue"};
    GDRoutingBlock initialRoutingBlock = ^BOOL(id<GDRoutingDelegate> delegate, NSString *urlString, NSDictionary *parameters) {
        blockDelegate = delegate;
        blockUrlString = urlString;
        blockParameters = parameters;
        return YES;
    };
    
    GDRoute *route = [GDRoute routeWithURLString:@"testString" andAction:initialRoutingBlock];
    
    BOOL routingBlockResult = initialRoutingBlock(initialDelegate, initialUrlString, initialParameters);
    
    //compare url strings
    XCTAssertTrue(routingBlockResult, @"RoutingBlockResult returned a NO");
    XCTAssertTrue([initialUrlString isEqualToString:route.urlString], @"Route urlString doesn't match");
    XCTAssertTrue([initialUrlString isEqualToString:blockUrlString], @"Block urlString doesn't match");
    
    //compare block parameters
    XCTAssertEqual(blockParameters.count, 1, @"BlockParamaters has the wrong key count");
    
    //compare block
    XCTAssertEqual(initialRoutingBlock, route.routingBlock, @"BlockParamaters has the wrong key count");
}

@end
