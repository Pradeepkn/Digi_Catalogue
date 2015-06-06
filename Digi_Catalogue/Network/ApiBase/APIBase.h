//
//  APIBase.h
//  CabHoundPassenger
//
//  Created by Tabrez on 4/18/13.
//  Copyright (c) 2013 Tarento technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIDefines.h"
#import "ParserUtility.h"
#import "Jastor.h"
#import "Constant.h"

@interface APIBase : Jastor

@property (nonatomic) NSInteger errorCode;
@property (nonatomic) NSInteger statusCode;
@property (nonatomic, strong) NSString *errorMessage;
@property (nonatomic,strong) NSMutableDictionary *Result;
@property (nonatomic,strong) NSMutableDictionary *parameters;
@property (nonatomic,strong) NSMutableDictionary *bodyParameters;
@property (nonatomic,strong) NSMutableDictionary *headerParams;
@property (nonatomic, strong) NSDate *cacheTimeStamp;
@property (nonatomic, strong) NSString *contentType;
@property (nonatomic, strong) NSData *binaryData;
@property (nonatomic) HTTPMethodType apiType;
@property (nonatomic) CachePolicy cacheing;
@property (nonatomic,strong) NSString *responceArrayString;


- (NSString *)apiName;

- (NSMutableDictionary *)createJsonObjectForRequest;

- (id)parseJsonObjectFromResponse:(id)lp_response;

- (void)displayError;

- (void)checkForNilValues;


- (void)apiCallDone:(BOOL)isApiCallDone customizeResponseOrDoSomeJob:(APIBase *)apiObject;

@end
