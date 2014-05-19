//
//  GDAppConfiguration.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/7/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDArchiving.h"

@interface GDAppConfiguration : NSObject <GDArchiving>

@property(strong, nonatomic) NSArray *usableAppArray;
@property(strong, nonatomic) NSString *baseCallbackURLString;

@end
