//
//  Cache.h
//  TelenorX
//
//  Created by Ashish Srivastava on 23/08/13.
//  Copyright (c) 2013 Tarento. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Cache : NSManagedObject

@property (nonatomic, retain) id value;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSDate *timeStamp;
@property (nonatomic, retain) NSNumber *refreshType;

@end
