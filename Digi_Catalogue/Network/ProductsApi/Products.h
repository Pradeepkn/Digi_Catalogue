//
//  Products.h
//  BrintDemo
//
//  Created by Pradeep on 29/11/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"

@interface Products : Jastor

@property (nonatomic, strong) NSString *PT;
@property (nonatomic, strong) NSMutableArray *items;

@end
