//
//  PICoreDataManager.m
//  PICentrix
//
//  Created by Selvin on 11/10/14.
//  Copyright (c) 2014 Tarento Technologies Pvt Ltd. All rights reserved.
//

#import "PICoreDataManager.h"

@interface PICoreDataManager () {
  NSManagedObjectContext *_writerManagedObjectContext;
}

/// this is the main managed object context for the coredata manager
@property(strong, nonatomic) NSManagedObjectContext *managedObjectContext;

/// The managed object model of the coredata manager
@property(strong, nonatomic) NSManagedObjectModel *managedObjectModel;

/// The persistent Store Coordinator of the coredata manager
@property(strong, nonatomic)
    NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation PICoreDataManager

+ (instancetype)sharedInstance {
  static PICoreDataManager *coreDataManagerSharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{ coreDataManagerSharedInstance = [super new]; });
  return coreDataManagerSharedInstance;
}

//∂i!!(1.0)@ref="http://i.stack.imgur.com/6ZaO8.png"ƒi

#pragma mark - Core Data stack
- (void)setupCoreDataStack {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
      _managedObjectContext = [self managedObjectContext];
      [self addSaveContextNotification];
  });
}

- (NSURL *)applicationDocumentsDirectory {
  // The directory the application uses to store the Core Data store file. This
  // code uses a directory named "Tarento-Technologies-Pvt-Ltd.PICentrix" in the
  // application's documents directory.
  return [[[NSFileManager defaultManager]
      URLsForDirectory:NSDocumentDirectory
             inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
  // The managed object model for the application. It is a fatal error for the
  // application not to be able to find and load its model.
  if (_managedObjectModel != nil) {
    return _managedObjectModel;
  }
  NSURL *modelURL =
      [[NSBundle mainBundle] URLForResource:@"PICentrix" withExtension:@"momd"];
  _managedObjectModel =
      [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
  return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
  // The persistent store coordinator for the application. This implementation
  // creates and return a coordinator, having added the store for the
  // application to it.
  if (_persistentStoreCoordinator != nil) {
    return _persistentStoreCoordinator;
  }

  // Create the coordinator and store

  _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
      initWithManagedObjectModel:[self managedObjectModel]];
  NSURL *storeURL = [[self applicationDocumentsDirectory]
      URLByAppendingPathComponent:@"PICentrix.sqlite"];
  NSError *error = nil;
  NSString *failureReason =
      @"There was an error creating or loading the application's saved data.";
  if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                 configuration:nil
                                                           URL:storeURL
                                                       options:nil
                                                         error:&error]) {
    // Report any error we got.
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSLocalizedDescriptionKey] =
        @"Failed to initialize the application's saved data";
    dict[NSLocalizedFailureReasonErrorKey] = failureReason;
    dict[NSUnderlyingErrorKey] = error;
    error =
        [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
    // Replace this with code to handle the error appropriately.
    // abort() causes the application to generate a crash log and terminate. You
    // should not use this function in a shipping application, although it may
    // be useful during development.
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }

  return _persistentStoreCoordinator;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
  NSError *error = nil;
  NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
  if (managedObjectContext != nil) {
    if ([managedObjectContext hasChanges] &&
        ![managedObjectContext save:&error]) {
      //      DDLogVerbose(@"Unresolved error %@, %@", error, [error userInfo]);
      abort();
    }
  }
}

/// This method will merge the notification context with the main context
- (void)addSaveContextNotification {
  [[NSNotificationCenter defaultCenter]
      addObserverForName:NSManagedObjectContextDidSaveNotification
                  object:nil
                   queue:nil
              usingBlock:^(NSNotification *note) {

                  NSManagedObjectContext *mainContext =
                      self.managedObjectContext;
                  NSManagedObjectContext *otherMoc = note.object;

                  if (otherMoc.persistentStoreCoordinator ==
                      mainContext.persistentStoreCoordinator) {
                    if (otherMoc != mainContext) {
                      [mainContext performBlock:^() {
                          [mainContext
                              mergeChangesFromContextDidSaveNotification:note];
                      }];
                    }
                  }
              }];
}

// main
- (NSManagedObjectContext *)managedObjectContext {
  if (_managedObjectContext != nil) {
    return _managedObjectContext;
  }

  _managedObjectContext = [[NSManagedObjectContext alloc]
      initWithConcurrencyType:NSMainQueueConcurrencyType];
  _managedObjectContext.parentContext = [self saveManagedObjectContext];

  return _managedObjectContext;
}

#pragma mark - read or write data -

// save context, parent of main context
- (NSManagedObjectContext *)saveManagedObjectContext {
  if (_writerManagedObjectContext != nil) {
    return _writerManagedObjectContext;
  }

  NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
  if (coordinator != nil) {
    _writerManagedObjectContext = [[NSManagedObjectContext alloc]
        initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [_writerManagedObjectContext setPersistentStoreCoordinator:coordinator];
  }
  return _writerManagedObjectContext;
}

- (void)save:(NSString *)entityName data:(id)entityData {

  NSManagedObjectContext *saveObjectContext = [self saveManagedObjectContext];

  // create background context
  NSManagedObjectContext *bgContext = [[NSManagedObjectContext alloc]
      initWithConcurrencyType:NSPrivateQueueConcurrencyType];
  bgContext.parentContext = saveObjectContext;

  [bgContext performBlock:^{

      // Based on the entity name & data we have to create the Entities and then
      // save the bgContext

      //        [bgContext save:&error];

      // no call here for main save...
      // instead use NSManagedObjectContextDidSaveNotification to merge changes
  }];
}

- (id)readEntityData:(NSString *)entityName
        forPredicate:(NSPredicate *)predicate {

  NSError *error = nil;
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity =
      [NSEntityDescription entityForName:entityName
                  inManagedObjectContext:self.managedObjectContext];
  [fetchRequest setEntity:entity];
  // Specify criteria for filtering which objects to fetch
  [fetchRequest setPredicate:predicate];
  // Specify how the fetched objects should be sorted
  //  NSSortDescriptor *sortDescriptor =
  //      [[NSSortDescriptor alloc] initWithKey:@"" ascending:YES];
  //  [fetchRequest
  //      setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];

  NSArray *fetchedObjects =
      [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];

  return fetchedObjects;
}

@end