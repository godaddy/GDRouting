//
//  GDTableDataModel.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDTableDataModel : NSObject

@property(nonatomic, strong, readonly) NSMutableArray *dataArray;
@property(nonatomic, strong, readonly) NSMutableArray *headerArray;

- (instancetype)initWithDataArray:(NSArray *)inDataArray andHeaderArray:(NSArray *)inHeaderArray;
- (id) objectInDataArrayAtIndexPath:(NSIndexPath *)inIndexPath;
- (id) objectInHeaderArrayAtPath:(NSIndexPath *)inIndexPath;
@end
