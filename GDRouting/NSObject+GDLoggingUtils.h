//
//  NSObject+GDLoggingUtils.h
//  MobileTraffic-iOS-Example
//
//  Created by Jonah G. Neugass on 3/6/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (GDLoggingUtils)

+ (void)logInfo:(NSString *)inInfoString;
+ (void)logError:(NSString *)inErrorString;

@end
