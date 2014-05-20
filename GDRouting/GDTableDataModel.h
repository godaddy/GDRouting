//
//  GDTableDataModel.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  GDTableDataModel makes dealing with UITableViews easier and cleaner
 */
@interface GDTableDataModel : NSObject

/**
 *  Array of data items to be used in table view
 */
@property(nonatomic, strong, readonly) NSMutableArray *dataArray;

/**
 *  Array of header items to be used in table view
 */
@property(nonatomic, strong, readonly) NSMutableArray *headerArray;

/**
 *  Constructor for GDTableDataModel
 *
 *  @param inDataArray   - Array of data items to be used in table view
 *  @param inHeaderArray - Array of header items to be used in table view
 *
 *  @return Instance of GDTableDataModel
 */
- (instancetype)initWithDataArray:(NSArray *)inDataArray andHeaderArray:(NSArray *)inHeaderArray;

/**
 *  Returns data item at section/row of inIndexPath
 *
 *  @param inIndexPath - section/row of data item
 *
 *  @return Data item at section/row of inIndexPath
 */
- (id) objectInDataArrayAtIndexPath:(NSIndexPath *)inIndexPath;

/**
 *  Returns header item at section/row of inIndexPath
 *
 *  @param inIndexPath - section/row of header item
 *
 *  @return Header item at section/row of inIndexPath
 */
- (id) objectInHeaderArrayAtPath:(NSIndexPath *)inIndexPath;

@end
