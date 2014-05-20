//
//  NSObject+FastCoder.m
//  Go Daddy Operating Company, LLCDomainBuy
//
//  Created by Jonah G. Neugass on 2/21/14.
//
//

#import "FastCoder.h"
#import "NSObject+FastCoder.h"
#import "NSObject+GDLoggingUtils.h"

@implementation NSObject (FastCoder)

+ (NSString *)documentsDirectory
{
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSObject *)readArchiveFile:(NSString *)inFileName;
{
	NSString *path = [[self documentsDirectory] stringByAppendingPathComponent:inFileName];
	@try
	{
		//attempt to load saved file
        
		NSData *data = [NSData dataWithContentsOfFile:path];
		NSObject *returnObject = [FastCoder objectWithData:data];
		return returnObject;
	}
	@catch (NSException *exception)
	{
		[NSObject logError:[NSString stringWithFormat:@"File %@ read operation threw an exception:%@", path, exception.reason]];
	}
}

+ (void)archiveFile:(NSString *)inFileName inObject:(NSObject *)inObject;
{
	NSString *path = [[[self class] documentsDirectory] stringByAppendingPathComponent:inFileName];
    
	@try
	{
		NSData *data = [FastCoder dataWithRootObject:inObject];
		[data writeToFile:path atomically:YES];
	}
	@catch (NSException *exception)
	{
		[NSObject logError:[NSString stringWithFormat:@"File %@ write operation threw an exception:%@", path, exception.reason]];
	}
}

+ (void)deleteFile:(NSString *)inFileName;
{
	NSFileManager *fileMgr = [NSFileManager defaultManager];
	NSString *path = [[self documentsDirectory] stringByAppendingPathComponent:inFileName];
    
	@try
	{
		NSError *error;
		if ([fileMgr fileExistsAtPath:path] && [fileMgr removeItemAtPath:path error:&error] != YES)
		{
			[NSObject logError:[NSString stringWithFormat:@"Unable to delete file: %@", [error localizedDescription]]];
		}
	}
	@catch (NSException *exception)
	{
		[NSObject logError:[NSString stringWithFormat:@"File %@ delete operation threw an exception:%@", path, exception.reason]];
	}
}

@end
