//
//  AFNetWorkAPIClient.h
//  CabHoundPassenger
//
//  Created by Tabrez on 4/18/13.
//  Copyright (c) 2013 Tarento technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface AFNetWorkAPIClient : AFHTTPClient

+ (AFNetWorkAPIClient *)sharedClient;

@end
