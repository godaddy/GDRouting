//
//  NSObject+GDLoggingUtils.m
//  MobileTraffic-iOS-Example
//
//  Created by Jonah G. Neugass on 3/6/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "NSObject+GDLoggingUtils.h"

@implementation NSObject (GDLoggingUtils)

+ (void)logInfo:(NSString *)inInfoString;
{
#ifdef GDLogLevelDebug
    
#ifdef DDLogInfo
	DDLogInfo(inInfoString);
#else
	NSLog(@"%@", inInfoString);
#endif
    
#endif
}

+ (void)logError:(NSString *)inErrorString;
{
#ifdef GDLogLevelDebug
    
#ifdef DDLogError
	DDLogError(inErrorString);
#else
	NSLog(@"%@", inErrorString);
#endif
    
#endif
}

@end
