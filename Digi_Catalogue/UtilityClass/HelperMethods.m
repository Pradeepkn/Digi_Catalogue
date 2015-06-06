//
//  HelperMethods.m
//  BrintDemo
//
//  Created by Tabrez on 26/09/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "HelperMethods.h"

@implementation HelperMethods


static HelperMethods *sharedInstance = nil;


+ (HelperMethods *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HelperMethods alloc] init];
    });
    
    return sharedInstance;
}


- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)messageString
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:messageString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)messageString
                  delegate:(id)delegate
                       tag:(int)tag
         cancelButtonTitle:(NSString *)cancelTitle
          otherButtonTitle:(NSString *)otherTitle
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:messageString delegate:delegate cancelButtonTitle:cancelTitle otherButtonTitles:otherTitle, nil];
    alertView.tag = tag;
    [alertView show];
}


- (BOOL)isAlertViewDisplaying
{
    for (UIWindow* window in [UIApplication sharedApplication].windows) {
        NSArray* subviews = window.subviews;
        if ([subviews count] > 0)
            if ([[subviews objectAtIndex:0] isKindOfClass:[UIAlertView class]])
                return YES;
    }
    return NO;
}

@end
