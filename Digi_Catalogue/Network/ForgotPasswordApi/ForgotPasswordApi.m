//
//  ForgotPasswordApi.m
//  BrintDemo
//
//  Created by Pradeep on 17/10/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "ForgotPasswordApi.h"

@implementation ForgotPasswordApi

@synthesize email;

- (id)init
{
    self = [super init];
    if (self) {
        //
    }
    return self;
}


#pragma mark -
#pragma mark - super class method.


- (NSString *)apiName
{
    return [NSString stringWithFormat:@"%@%@email=%@",[super apiName],kForgotPasswordUrl, self.email];
}


- (NSMutableDictionary *)createJsonObjectForRequest
{
    [super createJsonObjectForRequest];
    
    // Create request json object here..
    NSMutableDictionary *jsonObject = nil;
    
    return jsonObject;
}


- (void)checkForNilValues
{
    [super checkForNilValues];
}


- (id)parseJsonObjectFromResponse:(id)response
{
    [super parseJsonObjectFromResponse:response];
    
    if (response == [NSNull null]) {
        return nil;
    }
    
    if (API_SUCESS != self.statusCode) {
        return nil;
    }
    
//    NSDictionary *responseDict = [ParserUtility JSONObjectValue:response forKey:kResult];
//    NSString *value = [ParserUtility JSONObjectValue:responseDict forKey:kStatusCode];
//    self.statusCode = [NSNumber numberWithInteger:[value integerValue]];
//    self.errormessage = [ParserUtility JSONObjectValue:responseDict forKey:kErrorMessage];
//    value = [ParserUtility JSONObjectValue:responseDict forKey:kErrorCode];
//    self.errorCode = [NSNumber numberWithInteger:[value integerValue]];
//    
//    NSLog(@"Forgot Password Response = %@", responseDict);
    return nil;
}

@end
