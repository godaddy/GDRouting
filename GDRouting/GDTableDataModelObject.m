//
//  GDTableDataModelObject.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/6/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import "GDTableDataModelObject.h"

@implementation GDTableDataModelObject

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _parameterDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (instancetype)initWithParameterDictionary:(NSDictionary *)inDictionary
{
    self = [super init];
    if (self)
    {
        _parameterDictionary = [[NSMutableDictionary alloc] initWithDictionary:inDictionary];
    }
    return self;
}

- (instancetype)initWithParameterDictionary:(NSDictionary *)inDictionary andSelectedBlock:(GDTableDataModelSelectedBlock)inSelectedBlock
{
    self = [self initWithParameterDictionary:inDictionary];
    if (self)
    {
        _selectedBlock = inSelectedBlock;
    }
    return self;
}

@end
