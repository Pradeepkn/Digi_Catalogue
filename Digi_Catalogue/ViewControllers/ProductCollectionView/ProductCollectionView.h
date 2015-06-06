//
//  GoldDetailViewController.h
//  Digi_Catalogue
//
//  Created by Pradeep on 14/04/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"


typedef NS_ENUM(NSInteger, SearchOptions) {
    SearchItemInvalid = -1,
    SearchItemByPrice = 0,
    SearchItemByPurity,
    SearchItemByName
};

typedef struct searchBarFlags {
    BOOL doneClicked;
    BOOL clearClicked;
    BOOL searching;
} SearchBarFlags;

@interface ProductCollectionView : BaseViewController <UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) NSString *collectionType;
@property(nonatomic) SearchBarFlags searchFlags;
@property(nonatomic) CGFloat sliderRangeValue;
@property(strong, nonatomic) NSMutableArray *searchListArray;
@property(strong, nonatomic) NSMutableArray *dataSourceArray;
@property(strong, nonatomic) NSMutableArray *imagesArray;
@property(nonatomic) SearchOptions selectedSearchOption;

@end
