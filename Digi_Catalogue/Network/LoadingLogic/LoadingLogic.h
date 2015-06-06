//
//  LoadingLogic.h
//  BrintDemo
//
//  Created by Tabrez on 04/12/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoadingLogic : NSObject


+ (id)sharedLoadingLogic;

- (void)startBackGroundLoading;

@end
