//
//  SignUpApi.m
//  BrintDemo
//
//  Created by Pradeep on 09/10/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "SignUpApi.h"

@implementation SignUpApi
@synthesize signUpDetails;

- (id)init
{
    self = [super init];
    if (self) {
        //
        self.signUpDetails = [[SignUpDetails alloc] init];
    }
    return self;
}


#pragma mark -
#pragma mark - super class method.


- (NSString *)apiName
{
    return [NSString stringWithFormat:@"%@%@",[super apiName],kSignupApiUrl];
}


- (NSMutableDictionary *)createJsonObjectForRequest
{
    [super createJsonObjectForRequest];
    
    // Create request json object here..
    NSMutableDictionary *jsonObject = [[NSMutableDictionary alloc] initWithObjectsAndKeys:self.signUpDetails.username,@"username",self.signUpDetails.password,@"password",self.signUpDetails.email,@"email",self.signUpDetails.mnumber,@"mnumber", nil];
    
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
//    
//    NSString *value = [ParserUtility JSONObjectValue:responseDict forKey:kStatusCode];
//    self.statusCode = [NSNumber numberWithInteger:[value integerValue]];
//    self.errormessage = [ParserUtility JSONObjectValue:responseDict forKey:kErrorMessage];
//    value = [ParserUtility JSONObjectValue:responseDict forKey:kErrorCode];
//    self.errorCode = [NSNumber numberWithInteger:[value integerValue]];
//    
//    if ([response respondsToSelector:@selector(objectForKey:)]) {
//    }
//    
    return nil;
}


- (SignUpDetails *)parsedOffersDetails:(NSDictionary *)offersDict
{
    SignUpDetails *details = [[SignUpDetails alloc] init];
    
    return details;
}

@end
