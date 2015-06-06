//
//  DataUtility.h
//  BrintDemo
//
//  Created by Pradeep on 20/11/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"

@class DataUtility;
@class APIBase;

@interface DataUtility : NSObject


+ (DataUtility *)sharedInstance;

- (void)dataForObject:(APIBase *)apiObject response:(responseCallBack)completionBlock;
- (void)cacheDataForObject:(APIBase *)apiObject response:(responseCallBack)completionBlock;
- (void)apiDataForObject:(APIBase *)apiObject response:(responseCallBack)completionBlock;

@end
