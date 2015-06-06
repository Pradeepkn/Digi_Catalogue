//
//  DataStorage.m
//  BrintDemo
//
//  Created by Pradeep on 20/11/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "DataStorage.h"
#import "APIBase.h"
#import "Cache.h"

@implementation DataStorage

static DataStorage *sharedInstance = nil;

+ (DataStorage *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DataStorage alloc] init];
    });
    
    return sharedInstance;
}


- (id)cachedApiObjectFor:(id)apiObject
{
    id cachedObject = nil;
    
    APIBase *postDetails = (APIBase *)apiObject;
    
    NSString *objectClass = NSStringFromClass([apiObject class]);
    NSString *objectKey = [ NSString stringWithFormat:@"tx%@", [[postDetails.apiName capitalizedString] stringByReplacingOccurrencesOfString:@"/" withString:@""]];
    
    Cache *dataCache = [Cache MR_findFirstByAttribute:@"key" withValue:objectKey];
    if (dataCache != nil) {
        Class theClass = NSClassFromString(objectClass);
        cachedObject = [[theClass alloc] init];
        cachedObject = dataCache.value;
        [cachedObject apiCallDone:YES customizeResponseOrDoSomeJob:apiObject];
    }
    
    return cachedObject;
}


- (BOOL)storeApiObjectInCache:(id)apiObject
{
    BOOL success = NO;
    
    if (nil != apiObject) {
        APIBase *postDetails = (APIBase *)apiObject;
        
        if ((postDetails.statusCode == 404) || (postDetails.statusCode == 406) || (postDetails.statusCode >= 500 && postDetails.statusCode <= 599) || (postDetails.errorCode < 0)){
            return success;
        }
        
        NSString *objectKey = [NSString stringWithFormat:@"tx%@", [[postDetails.apiName capitalizedString] stringByReplacingOccurrencesOfString:@"/" withString:@""]];
        
        NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextWithParent:[NSManagedObjectContext MR_defaultContext]];
        Cache *dataCache = [Cache MR_findFirstByAttribute:@"key" withValue:objectKey];
        if (dataCache == nil) {
            dataCache = [Cache MR_createInContext:localContext];
        }
        
        postDetails.cacheTimeStamp = [NSDate date];
        
        dataCache.key = objectKey;
        dataCache.value = postDetails;
        dataCache.timeStamp = [NSDate date];
        [localContext MR_saveToPersistentStoreAndWait];
        
        success = YES;
    }
    
    return success;
}


- (BOOL)deleteApiObjectFromCache:(id)apiObject
{
    BOOL sucess = NO;
    
    if (nil != apiObject) {
        
        APIBase *postDetails = (APIBase *)apiObject;
        
        NSString *objectKey = [NSString stringWithFormat:@"tx%@", [[postDetails.apiName capitalizedString] stringByReplacingOccurrencesOfString:@"/" withString:@""]];
        
        NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextWithParent:[NSManagedObjectContext MR_defaultContext]];
        
        NSArray *allData = [Cache MR_findByAttribute:@"key" withValue:objectKey inContext:localContext];
        
        if (nil != allData) {
            for (Cache *data in allData) {
                sucess = YES;
                [data MR_deleteInContext:localContext];
            }
        }
        
        [localContext MR_saveToPersistentStoreWithCompletion:nil];
    }
    
    return sucess;
}

@end
