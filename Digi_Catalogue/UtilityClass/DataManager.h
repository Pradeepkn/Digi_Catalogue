//
//  DataManager.h
//  Digi_Catalogue
//
//  Created by Pradeep on 14/05/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Constant.h"

@interface DataManager : NSObject

@property (nonatomic, strong) NSMutableArray *favouritesArray;

/*!
 @abstract Shared instance to get and to store app data
 @discussion This class will made available through out app to access data
 @return sharedInstance
 @since 1.0
 */
+ (id)sharedInstance;

- (void)setHomeViewType:(HomeViewType)viewType;

- (HomeViewType)getCollectionViewType;

+ (void)applyShadowEffectForView:(UIView *)modifyingView;

@end
