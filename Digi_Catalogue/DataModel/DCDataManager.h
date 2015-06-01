//
//  DCDataManager.h
//  Digi_Catalogue
//
//  Created by Tabrez on 14/04/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCConstants.h"

@interface DCDataManager : NSObject


- (instancetype)sharedManager;


- (NSArray *)listOfProducts:(DCProductType)productType
                productName:(NSString *)name;

- (NSArray *)listOfProducts:(DCProductType)productType
              productPurity:(NSNumber *)purity;


- (NSArray *)listOfProducts:(DCProductType)productType
               productPrice:(NSNumber *)price;

@end
