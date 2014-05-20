//
//  GDArchiving.h
//  Go Daddy Operating Company, LLCDomainBuy
//
//  Created by Jonah G. Neugass on 2/21/14.
//
//

#import "NSObject+FastCoder.h"
#import <Foundation/Foundation.h>

@class GDBaseParser;

@protocol GDArchiving <NSObject>

@optional

+ (NSString *)getXMLFilePath;
+ (GDBaseParser *)getXMLFileParser;
+ (NSObject *)readArchivedObject;
- (void)archiveObject;
+ (void)deleteArchivedObject;

@end
