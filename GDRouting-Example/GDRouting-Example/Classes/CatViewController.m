//
//  SecondViewController.m
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/14/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import "CatViewController.h"
#import "TheSidebarController.h"

@interface CatViewController ()

@end

@implementation CatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (IBAction)menuButtonClicked:(id)sender
{
    [self.sidebarController presentLeftSidebarViewControllerWithStyle:SidebarTransitionStyleAirbnb];
}

@end
