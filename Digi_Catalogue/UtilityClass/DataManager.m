//
//  DataManager.m
//  Digi_Catalogue
//
//  Created by Pradeep on 14/05/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+ (DataManager *)sharedInstance
{
    static DataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[super allocWithZone:NULL] init];
    });
    
    return sharedInstance;
}

- (void)setHomeViewType:(HomeViewType)homeViewType {
    switch (homeViewType) {
        case HomeViewTab:
        {
            [[NSUserDefaults standardUserDefaults] setInteger:HomeViewTab forKey:COLLECTION_VIEW_TYPE];
        }
            break;
        case GoldViewTab:
        {
            [[NSUserDefaults standardUserDefaults] setInteger:GoldViewTab forKey:COLLECTION_VIEW_TYPE];
        }
            break;
        case DiamondViewTab:
        {
            [[NSUserDefaults standardUserDefaults] setInteger:DiamondViewTab forKey:COLLECTION_VIEW_TYPE];
        }
            break;
        case PlatinumViewTab:
        {
            [[NSUserDefaults standardUserDefaults] setInteger:PlatinumViewTab forKey:COLLECTION_VIEW_TYPE];
        }
            break;
        case SilverViewTab:
        {
            [[NSUserDefaults standardUserDefaults] setInteger:SilverViewTab forKey:COLLECTION_VIEW_TYPE];
        }
            break;
        case SettingsViewTab:
        {
            [[NSUserDefaults standardUserDefaults] setInteger:SettingsViewTab forKey:COLLECTION_VIEW_TYPE];
        }
            break;
        case FeedbackViewTab:
        {
            [[NSUserDefaults standardUserDefaults] setInteger:FeedbackViewTab forKey:COLLECTION_VIEW_TYPE];
        }
            break;
            
        default:
            break;
    }
}

- (HomeViewType)getCollectionViewType {
    HomeViewType homeViewType = (HomeViewType)[[NSUserDefaults standardUserDefaults] integerForKey:COLLECTION_VIEW_TYPE];
    return homeViewType;
}

@end
