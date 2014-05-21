//
//  MainMenuTableViewCell.h
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/15/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDConfigurableTableCell.h"

@interface MainMenuTableViewCell : UITableViewCell<GDConfigurableTableCell>

@property(nonatomic, weak) IBOutlet UILabel *menuItemLabel;

@end
