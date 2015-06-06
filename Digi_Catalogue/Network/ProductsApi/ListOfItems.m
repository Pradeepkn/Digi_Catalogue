//
//  ListOfItems.m
//  BrintDemo
//
//  Created by Pradeep on 01/12/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "ListOfItems.h"
#import "Products.h"

@implementation ListOfItems


@synthesize CT;
@synthesize products;


- (id)init
{
    self = [super init];
    
    if (self) {
        self.products = [[NSMutableArray alloc] init];
    }
    
    return self;
}


+ (Class)products_class
{
    return [Products class];
}


@end
