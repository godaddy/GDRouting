//
//  GDMenuItem.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDMenuItem : NSObject

/**
 *  Title of the menu item
 */
@property (nonatomic, strong) NSString *title;

/**
 *  Associated image displayed in the menu item cell
 */
@property (nonatomic, strong) NSString *iconImageName;

/**
 *  Section header of the menu item
 */
@property (nonatomic, strong) NSString *sectionTitle;

/**
 *  Order the menu item should be displayed in
 */
@property (nonatomic) NSInteger displayOrder;

/**
 *  Constructor for GDMenuItem
 *
 *  @param inTitle         Title of the menu item
 *  @param inIconImageName Associated image displayed in the menu item cell
 *
 *  @return GDMenuItem instance
 */
- (instancetype) initWithTitle:(NSString *)inTitle iconImageName:(NSString *)inIconImageName;

@end
