//
//  ViewController.m
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import "ManateeViewController.h"
#import "TheSidebarController.h"

@interface ManateeViewController ()

@end

@implementation ManateeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
