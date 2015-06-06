//
//  CollectionListOfItems.m
//  BrintDemo
//
//  Created by Tabrez on 02/12/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "CollectionListOfItems.h"
#import "ListOfItems.h"

@implementation CollectionListOfItems

@synthesize listOfItems;

+ (Class)listOfItems_class
{
    return [ListOfItems class];
}


@end
