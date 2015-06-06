//
//  Products.m
//  BrintDemo
//
//  Created by Pradeep on 29/11/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "Products.h"
#import "Items.h"

@implementation Products


@synthesize PT;
@synthesize items;


- (id)init
{
    self = [super init];
    
    if (self) {
        self.items = [[NSMutableArray alloc] init];
    }
    
    return self;
}


+ (Class)items_class
{
    return [Items class];
}

@end
