//
//  GDMenuItem.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDMenuItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *iconImageName;
@property (nonatomic, strong) NSString *sectionTitle;
@property (nonatomic) NSInteger displayOrder;

- (instancetype) initWithTitle:(NSString *)inTitle iconImageName:(NSString *)inIconImageName;

@end
