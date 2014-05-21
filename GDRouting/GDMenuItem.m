//
//  GDMenuItem.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "GDMenuItem.h"

@implementation GDMenuItem

- (instancetype) initWithTitle:(NSString *)inTitle andIconImageName:(NSString *)inIconImageName
{
    self = [super init];
    if( self != nil )
    {
        self.title = inTitle;
        self.iconImageName = inIconImageName;
    }
    return self;
}

- (instancetype) initWithTitle:(NSString *)inTitle andDisplayOrder:(NSInteger)inDisplayOrder
{
    self = [self initWithTitle:inTitle andIconImageName:nil];
    if( self != nil )
    {
        self.displayOrder = inDisplayOrder;
    }
    return self;
}

- (instancetype) initWithTitle:(NSString *)inTitle andDisplayOrder:(NSInteger)inDisplayOrder andIconImageName:(NSString *)inIconImageName
{
    self = [self initWithTitle:inTitle andIconImageName:inIconImageName];
    if( self != nil )
    {
        self.displayOrder = inDisplayOrder;
    }
    return self;
}
@end
