//
//  Constant.h
//  Digi_Catalogue
//
//  Created by Pradeep on 14/05/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//
#import "Jastor.h"

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

/*   RGB Macros   */

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define HELVETICA_LIGHT_FONT @"HelveticaNeue-UltraLight"

#define CACHE_REFRESH_INTERVAL 300


/*   Request methos enums   */

typedef NS_ENUM( NSUInteger, HTTPMethodType) {
    Get,
    Post,
    Put,
    Delete
};

/*   Custom Alert type enums   */

typedef NS_ENUM(NSInteger, DataType) {
    DataTypeOthers = -1,
    DataTypeNoData = 0, // No data available in DB
    DataTypeOldData, // Old data present in db, this means that, data time stamp has expired.
    DataTypeUsableData, // data present in db with in refresh time stamp specified.
    DataTypeApiData // Making Api call to server to get data.
};

typedef void (^responseCallBack)(id response, DataType dataType);

typedef enum {
    CACHE_DISABLED, // cacheing is disabled
    CACHE_MEMORY,  // cache the objects in memory not in datamodel
    CACHE_PERSISTANT, // cache in datamodel :if datamodel is absent then cache in memory
    REFRESH_MEMORY_CACHE, // fetch new data and cache in memory
    REFRESH_PERSISTANT_CACHE  // fetch new data and cache in datamodel :if datamodel is absent then cache in memory
} CachePolicy;


#endif
