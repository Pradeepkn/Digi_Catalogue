//
//  DCDataManager.m
//  Digi_Catalogue
//
//  Created by Tabrez on 14/04/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import "DCDataManager.h"

@implementation DCDataManager


- (instancetype)sharedManager {
    
    static DCDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DCDataManager alloc] init];
    });
    
    return sharedInstance;
}


#pragma mark -
#pragma mark - Search helper methods..


- (NSArray *)listOfProducts:(DCProductType)productType
                productName:(NSString *)name {
    
    NSArray *productsList = nil;
    
    //MR Code to entity search
    return productsList;
}


- (NSArray *)listOfProducts:(DCProductType)productType
              productPurity:(NSNumber *)purity {
    
    NSArray *productsList = nil;
    
    //MR Code to entity search
    return productsList;
}


- (NSArray *)listOfProducts:(DCProductType)productType
               productPrice:(NSNumber *)price {
    
    NSArray *productsList = nil;
    
    //MR Code to entity search
    return productsList;
}


@end
