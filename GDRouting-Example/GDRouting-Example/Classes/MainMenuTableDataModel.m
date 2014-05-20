//
//  MainMenuTableDataModel.m
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/7/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import "MainMenuTableDataModel.h"
#import "GDTableDataModelObject.h"
#import "GDMenuItem.h"
#import "GDRoute.h"

@implementation MainMenuTableDataModel

NSString * const MainMenuTableCellIdentifier = @"MainMenuTableCell";
NSString * const MainMenuTableHeaderCellIdentifier = @"MainMenuTableHeaderCell";

- (instancetype)initWithMenuItemArray:(NSArray *)inMenuItemArray andRouteArray:(NSArray *)inRouteArray andBaseAppURLString:(NSString *)inBaseAppURLString
{
    self = [super init];
    if (self)
    {
        NSMutableArray *section0Array = [[NSMutableArray alloc] init];
        for( int i = 0; i < inMenuItemArray.count; i++ )
        {
            GDMenuItem *item = inMenuItemArray[i];
            GDRoute *route = inRouteArray[i];
            if( item.sectionTitle != nil )
            {
                NSDictionary *parameterDictionary = @{@"title" : item.sectionTitle, @"cellIdentifier" : MainMenuTableHeaderCellIdentifier };
                GDTableDataModelObject *modelObject = [[GDTableDataModelObject alloc] initWithParameterDictionary:parameterDictionary];
                [section0Array addObject:modelObject];
            }
            
            NSDictionary *parameterDictionary = @{@"title" : item.title, @"cellIdentifier" : MainMenuTableCellIdentifier };
            GDTableDataModelSelectedBlock selectedBlock = ^BOOL(NSDictionary *properties)
            {
                NSURL *url = [route urlWithBaseAppURLString:inBaseAppURLString];
                [[UIApplication sharedApplication] openURL:url];
                return YES;
            };
            GDTableDataModelObject *modelObject = [[GDTableDataModelObject alloc] initWithParameterDictionary:parameterDictionary andSelectedBlock:selectedBlock];
            [section0Array addObject:modelObject];
            
        }
        [self.dataArray addObject:section0Array];
    }
    return self;
}


@end
