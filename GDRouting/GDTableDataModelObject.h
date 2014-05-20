//
//  GDTableDataModelObject.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL (^GDTableDataModelSelectedBlock)(NSDictionary *);

@interface GDTableDataModelObject : NSObject

@property(nonatomic, strong, readonly) NSMutableDictionary *parameterDictionary;
@property(nonatomic, strong) GDTableDataModelSelectedBlock selectedBlock;

- (instancetype)initWithParameterDictionary:(NSDictionary *)inDictionary;
- (instancetype)initWithParameterDictionary:(NSDictionary *)inDictionary andSelectedBlock:(GDTableDataModelSelectedBlock)inSelectedBlock;

@end
 