//
//  DataStorage.h
//  BrintDemo
//
//  Created by Pradeep on 20/11/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStorage : NSObject

+ (DataStorage *)sharedInstance;

- (id)cachedApiObjectFor:(id)apiObject;

- (BOOL)storeApiObjectInCache:(id)apiObject;

- (BOOL)deleteApiObjectFromCache:(id)apiObject;

@end
