//
//  GDAppConfiguration.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/7/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "GDAppConfiguration.h"
#import "GDUsableApp.h"

@implementation GDAppConfiguration

#pragma mark - GDArchiving protocol methods

static NSString * const ArchiveName = @"GDAppConfiguration.fast";

- (void)setUsableAppArray:(NSArray *)inUsableAppArray
{
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"displayOrder" ascending:YES];
    NSArray *sortedArray =  [inUsableAppArray sortedArrayUsingDescriptors:@[sort]];
    _usableAppArray = [[NSArray alloc] initWithArray:sortedArray];
}

#pragma mark - GDArchiving methods
+ (NSObject *)readArchivedObject;
{
	NSObject *returnObject = [NSObject readArchiveFile:ArchiveName];
	return returnObject;
}

- (void)archiveObject;
{
	[NSObject archiveFile:ArchiveName inObject:self];
}

+ (void)deleteArchivedObject;
{
	[NSObject deleteFile:ArchiveName];
}

- (NSString *)baseCallbackURLString
{
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSArray *urlTypes = [mainBundle objectForInfoDictionaryKey:@"CFBundleURLTypes"];
    NSDictionary *urlType = [urlTypes firstObject];
    NSArray *urlSchemes = urlType[@"CFBundleURLSchemes"];
    NSString *urlString = [urlSchemes firstObject];
    
    return urlString;
}

@end
