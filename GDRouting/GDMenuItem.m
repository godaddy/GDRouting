//
//  GDMenuItem.m
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "GDMenuItem.h"

@implementation GDMenuItem

- (instancetype) initWithTitle:(NSString *)inTitle iconImageName:(NSString *)inIconImageName
{
    self = [super init];
    if( self != nil )
    {
        self.title = inTitle;
        self.iconImageName = inIconImageName;
    }
    return self;
}

@end
