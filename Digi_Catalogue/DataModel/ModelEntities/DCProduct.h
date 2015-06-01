//
//  DCProduct.h
//  Digi_Catalogue
//
//  Created by Tabrez on 14/04/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DCProduct : NSManagedObject

@property (nonatomic, retain) NSString *productName;
@property (nonatomic, retain) NSNumber *productPrice;
@property (nonatomic, retain) NSNumber *productPurity;
@property (nonatomic, retain) NSNumber *productAvailable;
@property (nonatomic, retain) NSNumber *productType;

@end
