//
//  MainMenuViewController.m
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuTableViewController.h"
#import "UIStoryboard+QuickFetch.h"


@implementation MainMenuViewController

static NSString *const StoryboardName = @"Main";
static NSString *const ViewControllerIdentifier = @"MainMenuViewController";

+ (MainMenuViewController *)mainMenuViewControllerFromStoryboard
{
    return (MainMenuViewController *)[UIStoryboard instantiateViewControllerWithIdentifier:ViewControllerIdentifier andStoryboardName:StoryboardName];    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MainMenuTableViewController *mainTableViewController = (MainMenuTableViewController *)segue.destinationViewController;
    mainTableViewController.parentSideBarController = self.sidebarController;
}


@end
