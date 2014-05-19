//
//  GDBaseApp.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GDBaseApp <NSObject>

+ (UINavigationController *)baseNavigationController;
+ (NSArray *)menuItems;
+ (NSDictionary *)routesToRegister;

@end
