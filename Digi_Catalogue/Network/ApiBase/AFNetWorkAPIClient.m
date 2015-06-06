//
//  AFNetWorkAPIClient.m
//  CabHoundPassenger
//
//  Created by Tabrez on 4/18/13.
//  Copyright (c) 2013 Tarento technologies. All rights reserved.
//

#import "AFNetWorkAPIClient.h"
#import "AFJSONRequestOperation.h"
#import "APIBase.h"

@implementation AFNetWorkAPIClient

#define PARAMETER_ENCODING_STYLE AFJSONParameterEncoding

static AFNetWorkAPIClient *_sharedClient;

+ (AFNetWorkAPIClient *)sharedClient {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFNetWorkAPIClient alloc] initWithBaseURL:[NSURL URLWithString:KBaseURL]];
    });
    _sharedClient.parameterEncoding = PARAMETER_ENCODING_STYLE;
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end
