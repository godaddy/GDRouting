//
//  MainMenuTableDataModel.h
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/7/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "GDTableDataModel.h"

extern NSString * const MainMenuTableCellIdentifier;
extern NSString * const MainMenuTableHeaderCellIdentifier;

@interface MainMenuTableDataModel : GDTableDataModel

/**
 *  Constructor taking in an array of GDMenuItems, GDRoutes and a base appurl string. 
 *
 *  @param inMenuItemArray    Array of GDMenuItems
 *  @param inRouteArray       Array of GDRoutes
 *  @param inBaseAppURLString BaseAppUrlString used to create the x-callback-url
 *
 *  @return Instance of MainMenuTableDataModel
 */
- (instancetype)initWithMenuItemArray:(NSArray *)inMenuItemArray andRouteArray:(NSArray *)inRouteArray andBaseAppURLString:(NSString *)inBaseAppURLString;

@end
