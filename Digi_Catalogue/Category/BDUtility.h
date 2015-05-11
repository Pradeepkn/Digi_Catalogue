//
//  BDUtility.h
//  BrintDemo
//
//  Created by Pradeep on 19/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BDUtility : NSObject

+(BDUtility *)sharedInstance;

- (void)addShadowToView:(UIView *)view;

@end
