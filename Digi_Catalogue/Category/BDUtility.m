//
//  BDUtility.m
//  BrintDemo
//
//  Created by Pradeep on 19/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BDUtility.h"

@implementation BDUtility

static BDUtility *volatile mp_instance = nil;


+ (BDUtility*)sharedInstance{
    static dispatch_once_t sharedInstanceToken;
    dispatch_once(&sharedInstanceToken, ^{
        mp_instance = [[BDUtility alloc] init];
    });
    return mp_instance;
}

- (void)addShadowToView:(UIView *)view
{
    CALayer *layer = view.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.masksToBounds = NO;
    layer.shadowOpacity = 0.80f;
    layer.shadowRadius = 6.0f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
}

@end
