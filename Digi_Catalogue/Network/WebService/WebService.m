//
//  WebService.m
//  CabHoundPassenger
//
//  Created by Tabrez on 4/18/13.
//  Copyright (c) 2013 Tarento technologies. All rights reserved.
//

#import "WebService.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "AFNetWorkAPIClient.h"
#import "AFImageRequestOperation.h"
#import "UIImageView+AFNetworking.h"
#import "Reachability.h"

@implementation WebService

static WebService *webInstance;

+ (WebService*)sharedInstance
{
    @synchronized(self) {
        if(webInstance == nil) {
            webInstance	= [[super allocWithZone:NULL] init];
        }
    }
    return webInstance;
}


+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}


- (id)copyWithZone:(NSZone*)zone
{
    return self;
}

- (id)cachedApiObjectFor:(id)apiObject
{
    return nil;
    
    /*
     id cachedObject = nil;
     
     APIObject *postDetails = (APIObject *)apiObject;
     
     NSString *objectClass = NSStringFromClass([apiObject class]);
     NSString *objectKey = [ NSString stringWithFormat:@"tx%@", [[postDetails.apiName capitalizedString] stringByReplacingOccurrencesOfString:@"/" withString:@""]];
     
     Cache *dataCache = [Cache MR_findFirstByAttribute:@"key" withValue:objectKey];
     if (dataCache != nil) {
     Class theClass = NSClassFromString(objectClass);
     cachedObject = [[theClass alloc] init];
     cachedObject = dataCache.value;
     }
     
     return cachedObject;
     */
}


- (BOOL)storeApiObjectInCache:(id)apiObject
{
    return NO;
    
    /*
     
     BOOL sucess = NO;
     
     if (nil != apiObject) {
     APIObject *postDetails = (APIObject *)apiObject;
     
     NSString *objectKey = [ NSString stringWithFormat:@"tx%@", [[postDetails.apiName capitalizedString] stringByReplacingOccurrencesOfString:@"/" withString:@""]];
     
     NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
     Cache *dataCache = [Cache MR_findFirstByAttribute:@"key" withValue:objectKey];
     if (dataCache == nil) {
     dataCache = [Cache MR_createInContext:localContext];
     }
     
     postDetails.cacheTimeStamp = [NSDate date];
     
     dataCache.key = objectKey;
     dataCache.value = postDetails;
     dataCache.refreshType = [NSNumber numberWithInt:postDetails.cacheing];
     dataCache.timeStamp = [NSDate date];
     [localContext MR_saveToPersistentStoreWithCompletion:nil];
     
     sucess = YES;
     }
     
     return sucess;
     
     */
}


/**
 * Gives Api object from cache, doesn't make any api call..
 * @param Api object, Cache completion call back block
 * return callback via completion block, on success gives Api object from cache, on failure gives nil
 */


- (void)postParams:(id)params cache:(CachedBlock)cacheBlock
{
    cacheBlock(nil);
    
    //    // Access the content of the API object with base class
    //    APIObject *postDetails = (APIObject *)params;
    //
    //    // If the API call is PUT or DELETE return the nil, since there cannot be cache for such calls
    //    if (postDetails.apiType == Put || postDetails.apiType == Delete) {
    //        cacheBlock(nil);
    //    }
    //    else {
    //        id cachedObject = [self cachedApiObjectFor:postDetails];
    //        cacheBlock(cachedObject);
    //    }
    
}


- (NSMutableURLRequest *)createRequestObjectForParams:(id)params
{
    APIBase *apiObject = (APIBase *)params;
    
    NSString *requestMethod = [self apiTypeOfObject:apiObject];
    
    NSString *requestApiName = [apiObject.apiName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSMutableURLRequest *request = [[AFHTTPClient alloc] requestWithMethod:requestMethod path:requestApiName parameters:apiObject.parameters];
    
    if (apiObject.apiType != Get) {
        // get the resulting XML string
        if (apiObject.bodyParameters != nil) {
//            NSString* xml = [XMLWriter XMLStringFromDictionary:apiObject.bodyParameters];
//            DBLog(@"xml = %@",xml);
//            [request setHTTPBody:[xml dataUsingEncoding:NSUTF8StringEncoding]];
//            [request setValue:@"application/xml" forHTTPHeaderField: @"Content-Type"];
        }
    }
    
    if (apiObject.contentType) {
        if (apiObject.binaryData) {
            [request setValue:apiObject.contentType forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:apiObject.binaryData];
        }
    }
    
    if ([apiObject.headerParams count]) {
        for (NSString *key in apiObject.headerParams) {
            [request setValue:[apiObject.headerParams valueForKey:key] forHTTPHeaderField:key];
        }
    }
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    
    return request;
}


- (NSString *)apiTypeOfObject:(APIBase *)apiObject
{
    NSString *requestMethod = nil;
    
    switch (apiObject.apiType) {
        case Get:
            requestMethod = @"GET";
            break;
        case Post:
            requestMethod = @"POST";
            break;
        case Put:
            requestMethod = @"PUT";
            break;
        case Delete:
            requestMethod = @"DELETE";
            break;
        default:
            requestMethod = @"GET";
            break;
    }
    
    return requestMethod;
}



#pragma mark -
#pragma mark - post request

- (void)postRequest:(APIBase *)apiBase andCallback:(ApiCallBack)callback
{
    __block NSString *apiPath = [apiBase apiName];
    __block NSMutableDictionary *parameters = [apiBase createJsonObjectForRequest];
    
    [[AFNetWorkAPIClient sharedClient] postPath:apiPath parameters:parameters  success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        NSLog(@"JSON = %@",JSON);
        [apiBase parseJsonObjectFromResponse:JSON];
        
//        [self parseJsonUsingJastor:JSON withApiObject:apiBase];
        
        if (callback) {
            callback(apiBase, JSON, nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"error = %@",error);
        if (callback) {
            callback(apiBase, nil, error);
        }
    }];
}

#pragma mark -
#pragma mark - get request

- (void)getRequest:(APIBase *)apiBase andCallback:(ApiCallBack)callback
{
    __block NSString *apiPath = [apiBase apiName];
    __block NSMutableDictionary *parameters = [apiBase createJsonObjectForRequest];
    
    [[AFNetWorkAPIClient sharedClient] getPath:apiPath parameters:parameters  success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSLog(@"JSON = %@",JSON);
        
//        [self parseJsonUsingJastor:JSON withApiObject:apiBase];
        
        [apiBase parseJsonObjectFromResponse:JSON];
        
        callback(apiBase, JSON, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (callback) {
            callback(apiBase, nil, error);
        }
    }];
}

#pragma mark -
#pragma mark - cancel request

- (void)cancelHTTPOperationsWithMethod:(NSString *)method path:(NSString *)path
{
    [[AFNetWorkAPIClient sharedClient] cancelAllHTTPOperationsWithMethod:method path:path];
}

- (void)request:(APIBase *)apiBase andCallback:(ApiCallBack)callback
{
    switch (apiBase.apiType) {
        case Get:{
            [self getRequest:apiBase andCallback:^(APIBase *apiBase, id JSON, NSError *error) {
                if (callback) {
                    callback(apiBase, JSON, nil);
                }
            }];
        }
        break;
            
        case Post:{
            [self postRequest:apiBase andCallback:^(APIBase *apiBase, id JSON, NSError *error) {
                if (callback) {
                    callback(apiBase, JSON, nil);
                }
            }];
        }
        break;
            
        default:{
            [self getRequest:apiBase andCallback:^(APIBase *apiBase, id JSON, NSError *error) {
                if (callback) {
                    callback(apiBase, JSON, nil);
                }
            }];
        }
        break;
    }
}


- (void)parseJsonUsingJastor:(id)response withApiObject:(APIBase *)apiObject
{
    if (response) {
        if (apiObject.responceArrayString != nil) {
            
            NSDictionary *jastorCompatibleDictionary = response;
            if ([response isKindOfClass:[NSArray class]]) { // Outermost container is an array?
                // as the responce is array Jastor needs in key-value pairs , so creating custom responce
                jastorCompatibleDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:response, apiObject.responceArrayString, nil];
            }
            apiObject = [apiObject initWithDictionary :jastorCompatibleDictionary];
        }
        else {
                apiObject = [apiObject initWithDictionary:response];
        }
    }
}


@end
