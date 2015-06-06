//
//  HelperMethods.h
//  BrintDemo
//
//  Created by Tabrez on 26/09/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelperMethods : NSObject

+ (HelperMethods *)sharedInstance;

- (BOOL)validateString:(NSString *)string
          forMinLength:(int)minValue
             maxLength:(int)maxValue;

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)messageString;

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)messageString
                  delegate:(id)delegate
                       tag:(int)tag
         cancelButtonTitle:(NSString *)cancelTitle
          otherButtonTitle:(NSString *)otherTitle;

- (BOOL)isAlertViewDisplaying;

@end
