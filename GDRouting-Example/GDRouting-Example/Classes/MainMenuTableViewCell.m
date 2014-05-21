//
//  MainMenuTableViewCell.m
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/15/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "MainMenuTableViewCell.h"
#import "GDEnums.h"

@implementation MainMenuTableViewCell


- (void)configureWithParamaters:(NSDictionary *)inDictionary
{
     self.menuItemLabel.text = inDictionary[@(GDCellConfigKeyTitle)];
}

@end
