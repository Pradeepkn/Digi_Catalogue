//
//  LoadingLogic.m
//  BrintDemo
//
//  Created by Tabrez on 04/12/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "LoadingLogic.h"
#import "OffersApi.h"
#import "CollectionsApi.h"
#import "HomeScreenApi.h"
#import "OffersDetails.h"
#import "Products.h"
#import "Items.h"
#import "ListOfItems.h"
#import "DataUtility.h"

@implementation LoadingLogic

static LoadingLogic *loadingLogicSingleton = nil;
static NSString *const kGold = @"Gold";
static NSString *const kDiamond = @"Diamond";
static NSString *const kSilver = @"Silver";
static NSString *const kPlatinum = @"Platinum";

+ (id)sharedLoadingLogic {
  static dispatch_once_t pred;
  dispatch_once(&pred, ^{ loadingLogicSingleton = [[self alloc] init]; });
  return loadingLogicSingleton;
}

- (void)startBackGroundLoading {
  dispatch_async(dispatch_get_main_queue(), ^{ [self callHomeScreenApi]; });
  dispatch_async(dispatch_get_main_queue(), ^{ [self callOffersApi]; });
  dispatch_async(dispatch_get_main_queue(),
                 ^{ [self callCollectionApiForType:kGold]; });
  dispatch_async(dispatch_get_main_queue(),
                 ^{ [self callCollectionApiForType:kDiamond]; });
  dispatch_async(dispatch_get_main_queue(),
                 ^{ [self callCollectionApiForType:kPlatinum]; });
  dispatch_async(dispatch_get_main_queue(),
                 ^{ [self callCollectionApiForType:kSilver]; });
}

- (void)callOffersApi {
  OffersApi *apiObject = [[OffersApi alloc] init];
  apiObject.apiType = Get;
  apiObject.cacheing = CACHE_PERSISTANT;
  [self makeApiCallForObject:apiObject
                    response:^(APIBase *response, DataType dataType) {
                        if (apiObject.errorCode == 0) {
                          for (OffersDetails *offersDetails in apiObject
                                   .offers) {
                              [self storeImagesFromUrl:offersDetails.offer_image];
                          }
                        }
                    }];
}

- (void)callCollectionApiForType:(NSString *)apiType {
  CollectionsApi *apiObject = [[CollectionsApi alloc] init];
  apiObject.apiType = Get;
  apiObject.cacheing = CACHE_MEMORY;
  apiObject.collectionApiName = apiType;

  [self makeApiCallForObject:apiObject
                    response:^(APIBase *response, DataType dataType) {
                        if (apiObject.errorCode == 0) {
                            for (ListOfItems *listOfItems in apiObject.listOfItems) {
                                for (Products *products in listOfItems.products) {
                                    for (Items *items in products.items) {
                                        [self storeImagesFromUrl:items.uri];
                                    }
                                }
                            }
                        }
                    }];
}

- (void)callHomeScreenApi {
  HomeScreenApi *apiObject = [[HomeScreenApi alloc] init];
  apiObject.apiType = Get;
  apiObject.cacheing = CACHE_PERSISTANT;

  [self makeApiCallForObject:apiObject
                    response:^(APIBase *response, DataType dataType) {
                        if (apiObject.errorCode == 0) {

                          for (HomeScreenDetails *homescreenDetails in apiObject
                                   .homeScreenImagesArray) {
                              [self storeImagesFromUrl:homescreenDetails.uri];
                          }
                        }
                    }];
}

- (void)makeApiCallForObject:(APIBase *)apiObject
                    response:(responseCallBack)completionBlock {
  [[DataUtility sharedInstance]
      apiDataForObject:apiObject
              response:^(APIBase *response, DataType dataType) {
                  completionBlock(response, DataTypeApiData);
              }];
}

- (void)storeImagesFromUrl:(NSString *)url
{
    UIImageView *temp = [[UIImageView alloc] init];
//    [temp sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:url] andPlaceholderImage:[UIImage imageNamed:@"loading.png"] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//    }];
}
@end
