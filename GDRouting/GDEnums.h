//
//  GDEnums.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/21/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#ifndef GDRouting_Example_GDEnums_h
#define GDRouting_Example_GDEnums_h

/**
 *  Enum for dictionary keys to be used for common cell configuration 
 */
typedef NS_OPTIONS(NSUInteger, GDCellConfigKey) {
    /**
     *  Key for cell identifier
     */
    GDCellConfigKeyCellIdentifier = 1 << 0,
    /**
     *  Key for cell title
     */
    GDCellConfigKeyTitle = 1 << 1,
};

#endif
