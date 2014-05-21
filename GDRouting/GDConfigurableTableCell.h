//
//  GDConfigurableTableCell.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/21/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GDConfigurableTableCell <NSObject>

- (void)configureWithParamaters:(NSDictionary *)inDictionary;

@end
