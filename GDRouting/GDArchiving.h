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

/**
 *  Protocol that adds methods used for archiving, loading and deleting objects to/from disk.
 */
@protocol GDArchiving <NSObject>

/**
 *  Read archived object from disk
 *
 *  @return Archived object.
 */
+ (NSObject *)readArchivedObject;

/**
 *  Archives object to disk
 */
- (void)archiveObject;

/**
 *  Deletes archived object from disk
 */
+ (void)deleteArchivedObject;

@end
