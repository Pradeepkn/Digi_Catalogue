//
//  WebService.h
//  CabHoundPassenger
//
//  Created by Tabrez on 4/18/13.
//  Copyright (c) 2013 Tarento technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIBase.h"

typedef void (^ApiCallBack)(APIBase *,id,NSError*);
typedef void  (^UploadFileCallBack)(id, id, NSError*);
typedef void (^CachedBlock)(id cache);

@interface WebService : NSObject

+ (WebService*)sharedInstance;

- (void)postRequest:(APIBase *)tibBase andCallback:(ApiCallBack)callback;

- (void)getRequest:(APIBase *)tibBase andCallback:(ApiCallBack)callback;

/* Cancel HTTP request  */

- (void)cancelHTTPOperationsWithMethod:(NSString *)method path:(NSString *)path;

- (void)request:(APIBase *)apiBase andCallback:(ApiCallBack)callback;

@end
