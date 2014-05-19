//
//  MainMenuTableDataModel.h
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/7/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import "GDTableDataModel.h"

extern NSString * const MainMenuTableCellIdentifier;
extern NSString * const MainMenuTableHeaderCellIdentifier;

@interface MainMenuTableDataModel : GDTableDataModel

- (instancetype)initWithMenuItemArray:(NSArray *)inMenuItemArray andRouteArray:(NSArray *)inRouteArray andBaseAppURLString:(NSString *)inBaseAppURLString;

@end
