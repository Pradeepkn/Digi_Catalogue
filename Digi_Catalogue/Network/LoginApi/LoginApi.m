//
//  LoginApi.m
//  BrintDemo
//
//  Created by Pradeep on 17/10/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "LoginApi.h"

@implementation LoginApi

@synthesize loginDetails;

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
    return [NSString stringWithFormat:@"%@%@",[super apiName],kLoginApiUrl];
}


- (NSMutableDictionary *)createJsonObjectForRequest
{
    [super createJsonObjectForRequest];
    
    // Create request json object here..
    NSMutableDictionary *jsonObject = [[NSMutableDictionary alloc] initWithObjectsAndKeys:self.loginDetails.username,@"username",self.loginDetails.password,@"password",self.loginDetails.email,@"email",self.loginDetails.mnumber,@"mnumber", nil];

    
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
    return nil;
}


- (LoginDetails *)parsedOffersDetails:(NSDictionary *)loginDict
{
    LoginDetails *details = [[LoginDetails alloc] init];
    return details;
}


@end
