//
//  GDTableDataModelObject.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Selection block for when the index path for the associated GDTableDataModelObject is selected
 *
 *  @param  Parameter dictionary passed to the block
 *
 *  @return Returns YES if block was called
 */
typedef BOOL (^GDTableDataModelSelectedBlock)(NSDictionary *);

/**
 *  GDTableDataModelObject is an object which provides a table view information about the cell it is associated with
 */
@interface GDTableDataModelObject : NSObject

/**
 *  Dictionary of paramaters describing the associated table cell
 */
@property(nonatomic, strong, readonly) NSMutableDictionary *parameterDictionary;

/**
 *  Selection block for when the index path for the associated GDTableDataModelObject is selected
 */
@property(nonatomic, strong) GDTableDataModelSelectedBlock selectedBlock;

/**
 *  Constructor taking a parameter dictionary as an argument
 *
 *  @param inDictionary - Dictionary of paramaters describing the associated table cell
 *
 *  @return Instance of GDTableDataModelObject
 */
- (instancetype)initWithParameterDictionary:(NSDictionary *)inDictionary;

/**
 *  Constructor taking a parameter dictionary and a selection block as arguments
 *
 *  @param inDictionary    - Dictionary of paramaters describing the associated table cell
 *  @param inSelectedBlock - Selection block for when the index path for the associated GDTableDataModelObject is selected
 *
 *  @return Instance of GDTableDataModelObject
 */
- (instancetype)initWithParameterDictionary:(NSDictionary *)inDictionary andSelectedBlock:(GDTableDataModelSelectedBlock)inSelectedBlock;

@end
 