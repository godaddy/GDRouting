//
//  NSObject+FastCoder.h
//  Go Daddy Operating Company, LLCDomainBuy
//
//  Created by Jonah G. Neugass on 2/21/14.
//
//

#import <Foundation/Foundation.h>

/**
 *  Category that provides a wrapper around FastCoder
 */
@interface NSObject (FastCoder)

/**
 *  Reads an archived file provided a file name
 *
 *  @param inFileName - File name to read
 *
 *  @return Unseralized object read from disk
 */
+ (NSObject *)readArchiveFile:(NSString *)inFileName;

/**
 *  Archives an object to the provided file name
 *
 *  @param inFileName - File name to serialize object to
 *  @param inObject   - Object to serialize
 */
+ (void)archiveFile:(NSString *)inFileName inObject:(NSObject *)inObject;

/**
 *  Deletes a file from disk with the provided file name
 *
 *  @param inFileName - file name to delete
 */
+ (void)deleteFile:(NSString *)inFileName;

@end
