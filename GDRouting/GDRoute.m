//
//  GDRoute.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "GDRoute.h"

@implementation GDRoute

+(instancetype)routeWithURLString:(NSString *)inURLString andAction:(GDRoutingBlock)inRoutingBlock
{
    GDRoute *returnRoute = [[GDRoute alloc] init];
    returnRoute.urlString = inURLString;
    returnRoute.routingBlock = inRoutingBlock;
    return returnRoute;
}

+(instancetype)routeWithURLString:(NSString *)inURLString andDisplayOrder:(NSInteger)inDisplayOrder andAction:(GDRoutingBlock)inRoutingBlock
{
    GDRoute *returnRoute = [GDRoute routeWithURLString:inURLString andAction:inRoutingBlock];
    returnRoute.displayOrder = inDisplayOrder;
    return returnRoute;
}

- (NSURL *)urlWithBaseAppURLString:(NSString *)inBaseAppURLString
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@:/%@",inBaseAppURLString, self.urlString]];
    return url;
}

@end
