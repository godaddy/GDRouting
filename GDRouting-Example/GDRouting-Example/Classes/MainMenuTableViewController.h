//
//  MainMenuTableViewController.h
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/7/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheSidebarController.h"

@interface MainMenuTableViewController : UITableViewController

@property(nonatomic, strong) TheSidebarController *parentSideBarController;

@end
