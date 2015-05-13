//
//  Constant.h
//  Digi_Catalogue
//
//  Created by Pradeep on 14/05/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#ifndef Digi_Catalogue_Constant_h
#define Digi_Catalogue_Constant_h

#define COLLECTION_VIEW_TYPE @"COLLECTION_VIEW_TYPE"


#define CLEAR_COLOR [UIColor clearColor]

#define WHITE_COLOR [UIColor whiteColor]

#define BLACK_COLOR [UIColor blackColor]

#define BLACK_HALF_TRANSPARENT [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]

#define BLACK_ONE_THIRD_TRANSPARENT [UIColor colorWithRed:0 green:0 blue:0 alpha:0.75]

#define WHITE_LIGHT [UIColor colorWithRed:1 green:1 blue:1 alpha:0.25]

#define WHITE_HALF_TRANSPARENT [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5]

/******** Home view collection type ********/

typedef enum {
    HomeViewTab,
    GoldViewTab,
    SilverViewTab,
    DiamondViewTab,
    PlatinumViewTab,
    SettingsViewTab,
    FeedbackViewTab
} HomeViewType;

#endif
