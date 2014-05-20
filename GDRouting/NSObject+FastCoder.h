//
//  NSObject+FastCoder.h
//  Go Daddy Operating Company, LLCDomainBuy
//
//  Created by Jonah G. Neugass on 2/21/14.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (FastCoder)

+ (NSObject *)readArchiveFile:(NSString *)inFileName;
+ (void)archiveFile:(NSString *)inFileName inObject:(NSObject *)inObject;
+ (void)deleteFile:(NSString *)inFileName;

@end
