//
//  PICoreDataManager.h
//  PICentrix
//
//  Created by Selvin on 11/10/14.
//  Copyright (c) 2014 Tarento Technologies Pvt Ltd. All rights reserved.
//
#import <CoreData/CoreData.h>

/*!
 @discussion This class is for managing CoreData reads & writes

 ## Version information

 __Version__: 1.0

 __Found__: 11/10/2014

 __Last update__: 11/10/2014

 __Developer__: Selvin, Tarento Technologies Pvt Ltd.

 */
@interface PICoreDataManager : NSObject

//EnableSingletonProtection;

/*!
 @abstract Returns the singleton's instance

 @return `PICoreDataManager` instance

 @since 1.0
 */
+ (instancetype)sharedInstance;

/*!
 @abstract To setup the coredata stack, invoke this method

 @discussion We are going to use the option A that is discussed in the
 following Stack Overflow answer. http://stackoverflow.com/a/24663533/569497

 @since 1.0
 */
//∂i!!(1.0)@ref="http://i.stack.imgur.com/6ZaO8.png"ƒi
- (void)setupCoreDataStack;

/*!
 @abstract This method is used to persist the managed object contexts.

 @discussion This can be called whenever you want to persist the data
 immediately.

 @since 1.0
 */
- (void)saveContext;

/// @name Coredata ReadWrite Methods

/*!
 @abstract This method is used to write data of a particular entity into
 coredata

 @discussion First a background context `bgContext` is created. The parent of
 the `bgContext` is the `writerContext` which is also the parent context of
 `mainContext`. The entity are created in `bgContext` and then the `bgContext`
 is saved. In the `NSManagedObjectContextDidSaveNotification` call back the
 `bgContext` and the `mainContext` are merged.

 @param entityName the name of the entity which we want to write into coredata
 @param entityData the data for the entity in `NSArray` or `NSDictionary`
 format.

 @since 1.0
 */
- (void)save:(NSString *)entityName data:(id)entityData;

/*!
 @abstract This method is used to read an entity from the `mainContext`

 @discussion You are supposed to read the entities only from `mainContext` since
 it is has the MainQueueConcurrency.

 @param entityName the name of the entity we want to read from the `mainContext`
 @param predicate The predeicate we want to use for filtering the FetchedResult.

 @return The desired ManagedObject from the `mainContext`. It can be a single
 object or an Array.

 @warning This method may return a single object or a array of Objects depending
 on the predicate or depending on the internal implementation. The caller should
 handle the returned data accordingly. Its not going to be a problem because the
 caller must already know what to expect from the method. Just the returned data
 has to be typecasted in to the relevant type.

 @since 1.0
 */
- (id)readEntityData:(NSString *)entityName
        forPredicate:(NSPredicate *)predicate;

@end
