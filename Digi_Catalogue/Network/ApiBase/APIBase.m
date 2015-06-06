//
//  APIBase.m
//  CabHoundPassenger
//
//  Created by Tabrez on 4/18/13.
//  Copyright (c) 2013 Tarento technologies. All rights reserved.
//

#import "APIBase.h"
#import "HelperMethods.h"

@implementation APIBase

@synthesize statusCode;
@synthesize errorMessage;
@synthesize errorCode;
@synthesize parameters;
@synthesize bodyParameters;
@synthesize headerParams;
@synthesize cacheTimeStamp;
@synthesize contentType;
@synthesize binaryData;
@synthesize apiType;
@synthesize cacheing;
@synthesize responceArrayString;

@synthesize Result;

- (id)init
{
    self = [super init];
    
    if (self) {
        self.statusCode = 0;
        self.errorCode = 0;
        self.apiType = Get;
        self.errorMessage = [[NSString alloc] init];
        self.parameters = [[NSMutableDictionary alloc]init];
        self.bodyParameters = [[NSMutableDictionary alloc]init];
        self.headerParams = [[NSMutableDictionary alloc]init];
//        self.Result = [[NSMutableDictionary alloc] init];

        [self.headerParams setObject:[[NSLocale preferredLanguages] objectAtIndex:0] forKey:@"Accept-Language"];
        self.cacheTimeStamp = [NSDate date];
        self.contentType = @"application/json";
        self.binaryData = nil;
        self.cacheing = CACHE_DISABLED;
    }
    
    return self;
}


#pragma -
#pragma - mark super class method.


- (NSString *)apiName
{
    return KBaseURL;
}


- (NSMutableDictionary *)createJsonObjectForRequest
{
    return nil;
}


- (id)parseJsonObjectFromResponse:(id)response
{
    if ([response respondsToSelector:@selector(objectForKey:)]) {
        NSDictionary *responseDict = [ParserUtility JSONObjectValue:response forKey:kResult];
        
        self.statusCode = [[ParserUtility JSONObjectValue:responseDict forKey:kStatusCode] integerValue];
        self.errorMessage = [ParserUtility JSONObjectValue:responseDict forKey:kErrorMessage];
        self.errorCode = [[ParserUtility JSONObjectValue:responseDict forKey:kErrorCode] integerValue];
    }
    
    return nil;
}


- (void)displayError
{
    NSString *displayErrorMessage = self.errorMessage;
    if (nil == displayErrorMessage) {
        displayErrorMessage = NSLocalizedString(@"serverError", @"some error in server.");
    }
    [[HelperMethods sharedInstance] showAlertWithTitle:@"" message:displayErrorMessage];
}


- (void)checkForNilValues
{
    
}


- (void)apiCallDone:(BOOL)isApiCallDone customizeResponseOrDoSomeJob:(APIBase *)apiObject
{
    ;
}


@end