//
//  DataUtility.m
//  BrintDemo
//
//  Created by Pradeep on 20/11/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "DataUtility.h"
#import "APIBase.h"
#import "BrinDemoAppDelegate.h"
#import "DataStorage.h"
#import "WebService.h"

static DataUtility *sharedInstance = nil;

@implementation DataUtility

+ (DataUtility *)sharedInstance {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
        sharedInstance = [[DataUtility alloc] init];
  });

  return sharedInstance;
}

// By default cacheing is enabled for all api objects, disable to make direct api call..
// By default api call is GET, assign proper call type before sending apiobject..

- (void)dataForObject:(APIBase *)apiObject response:(responseCallBack)completionBlock;
{
  APIBase *cachedObject = nil;

  BOOL isCacheEnabled = [self isCacheEnabled:apiObject];

  if (isCacheEnabled) {

    cachedObject = [[DataStorage sharedInstance] cachedApiObjectFor:apiObject];

    if (nil == cachedObject) {
      [[WebService sharedInstance] request:apiObject andCallback:^(APIBase *apiObject, id JSON, NSError *error) {
                [[DataStorage sharedInstance] storeApiObjectInCache:apiObject];
                [self callCompletionBlockOnMainThread:completionBlock responseObject:JSON dataType:DataTypeApiData];
      }];
    } else {
      if (ABS([cachedObject.cacheTimeStamp timeIntervalSinceNow]) < CACHE_REFRESH_INTERVAL) {
        if (completionBlock) {
          [self callCompletionBlockOnMainThread:completionBlock responseObject:cachedObject dataType:DataTypeUsableData];
        }
      } else {
        // Data has expired, need to refresh..
        [self callCompletionBlockOnMainThread:completionBlock responseObject:cachedObject dataType:DataTypeOldData];

        [[WebService sharedInstance] request:apiObject andCallback:^(APIBase *apiObject, id JSON, NSError *error) {
                    [[DataStorage sharedInstance] storeApiObjectInCache:apiObject];
                    [self callCompletionBlockOnMainThread:completionBlock responseObject:JSON dataType:DataTypeApiData];
        }];
      }
    }
  } else {
    [[WebService sharedInstance] request:apiObject andCallback:^(APIBase *apiObject, id JSON, NSError *error) {
            //completionBlock(response, DataTypeApiData);
            [self callCompletionBlockOnMainThread:completionBlock responseObject:JSON dataType:DataTypeApiData];
    }];
  }
}

- (void)callCompletionBlockOnMainThread:(responseCallBack)completionBlock responseObject:(id)response dataType:(DataType)dataType {
  dispatch_async(dispatch_get_main_queue(), ^{
        completionBlock(response, dataType);
  });
}

// Directly call api.. disable cache if you dont need it to store..
- (void)apiDataForObject:(APIBase *)apiObject response:(responseCallBack)completionBlock;
{
  BOOL isCacheEnabled = [self isCacheEnabled:apiObject];

  [[WebService sharedInstance] request:apiObject andCallback:^(APIBase *apiObject, id JSON, NSError *error) {
        //completionBlock(response, DataTypeApiData);
        
        [self callCompletionBlockOnMainThread:completionBlock responseObject:JSON dataType:DataTypeApiData];
        
        if (isCacheEnabled) {
            if (!apiObject.errorCode) {
                [[DataStorage sharedInstance] storeApiObjectInCache:apiObject];
            }
        }

  }];
}

// This method checks and returns cached data for that Api..
- (void)cacheDataForObject:(APIBase *)apiObject response:(responseCallBack)completionBlock {
  APIBase *cachedObject = nil;

  cachedObject = [[DataStorage sharedInstance] cachedApiObjectFor:apiObject];

  if (nil == cachedObject) {
    //completionBlock (nil, DataTypeNoData);

    [self callCompletionBlockOnMainThread:completionBlock responseObject:nil dataType:DataTypeNoData];
  } else {
    if (ABS([cachedObject.cacheTimeStamp timeIntervalSinceNow]) < CACHE_REFRESH_INTERVAL) {
      if (completionBlock) {

        //completionBlock(cachedObject, DataTypeUsableData);

        [self callCompletionBlockOnMainThread:completionBlock responseObject:cachedObject dataType:DataTypeUsableData];
      }
    } else {
      //completionBlock (cachedObject, DataTypeOldData);

      [self callCompletionBlockOnMainThread:completionBlock responseObject:cachedObject dataType:DataTypeOldData];
    }
  }
}

// Retruns YES if cache is enabled and NO if disabled..

- (BOOL)isCacheEnabled:(APIBase *)apiObject {
  BOOL cacheEnabled = NO;

  if (!(apiObject.apiType == Put || apiObject.apiType == Delete)) {
    if ((apiObject.cacheing == REFRESH_MEMORY_CACHE || apiObject.cacheing == REFRESH_PERSISTANT_CACHE)) {
      cacheEnabled = YES;
    }
  }

  return cacheEnabled;
}

@end
