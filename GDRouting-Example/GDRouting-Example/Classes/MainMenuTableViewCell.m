//
//  MainMenuTableViewCell.m
//  GDDiscovery-MainMenu-Example
//
//  Created by Jonah G. Neugass on 5/15/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import "MainMenuTableViewCell.h"

@implementation MainMenuTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
