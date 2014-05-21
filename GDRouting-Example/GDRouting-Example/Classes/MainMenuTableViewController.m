//
//  MainMenuTableViewController.m
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/7/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "MainMenuTableViewController.h"
#import "MainMenuTableDataModel.h"
#import "GDTableDataModelObject.h"
#import "GDAppConfiguration.h"
#import "GDAppManager.h"
#import "MainMenuTableViewCell.h"
#import "GDConfigurableTableCell.h"
#import "GDEnums.h"

@interface MainMenuTableViewController ()

@property(nonatomic, strong) MainMenuTableDataModel *dataModel;

@end

@implementation MainMenuTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self.parentSideBarController action:@selector(dismissSidebarViewController)];
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.tableView addGestureRecognizer:swipeRecognizer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    _dataModel = nil;
}

- (MainMenuTableDataModel *)dataModel
{
    if( _dataModel == nil )
    {
        GDAppConfiguration *config = (GDAppConfiguration *)[GDAppConfiguration readArchivedObject];
        GDAppManager *appManager = [[GDAppManager alloc] initWithUsableAppArray:config.usableAppArray];
        _dataModel = [[MainMenuTableDataModel alloc] initWithMenuItemArray:[appManager getGDMenuItemsForApps] andRouteArray:[appManager getGDRouteArrayForApps] andBaseAppURLString:config.baseCallbackURLString];
    }
    return _dataModel;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger sectionCount = self.dataModel.dataArray.count;
    return sectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionArray = self.dataModel.dataArray[section];
    return sectionArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GDTableDataModelObject *modelObject = [self.dataModel objectInDataArrayAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:modelObject.parameterDictionary[@(GDCellConfigKeyCellIdentifier)] forIndexPath:indexPath];
    if( [cell conformsToProtocol:@protocol(GDConfigurableTableCell)])
    {
        [cell performSelector:@selector(configureWithParamaters:) withObject:modelObject.parameterDictionary];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GDTableDataModelObject *modelObject = [self.dataModel objectInDataArrayAtIndexPath:indexPath];
    if( modelObject.selectedBlock != nil )
    {
        modelObject.selectedBlock(nil);
        [self.parentSideBarController dismissSidebarViewController];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
