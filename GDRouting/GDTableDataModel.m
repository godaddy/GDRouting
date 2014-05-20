//
//  GDTableDataModel.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "GDTableDataModel.h"

@implementation GDTableDataModel

- (instancetype)init
{
    self = [super init];
    if( self != nil )
    {
        _dataArray = [[NSMutableArray alloc] init];
        _headerArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (instancetype)initWithDataArray:(NSMutableArray *)inDataArray andHeaderArray:(NSMutableArray *)inHeaderArray
{
    self = [self init];
    if( self != nil )
    {
        [_dataArray setArray:inDataArray];
        [_headerArray setArray:inHeaderArray];
    }
    return self;
}

- (id) objectInDataArrayAtIndexPath:(NSIndexPath *)inIndexPath
{
    id returnObject = nil;
    if( inIndexPath.section < self.dataArray.count )
    {
        NSArray *rowArray = self.dataArray[inIndexPath.section];
        if( inIndexPath.row <  rowArray.count )
        {
            returnObject = rowArray[inIndexPath.row];
        }
    }
    return returnObject;
}

- (id) objectInHeaderArrayAtPath:(NSIndexPath *)inIndexPath
{
    id returnObject = nil;
    if( inIndexPath.section < self.headerArray.count )
    {
        NSArray *rowArray = self.headerArray[inIndexPath.section];
        if( inIndexPath.row < rowArray.count )
        {
            returnObject = rowArray[inIndexPath.row];
        }
    }
    return returnObject;
}

@end
