//
//  OffersApi.h
//  BrintDemo
//
//  Created by Tabrez on 27/09/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "APIBase.h"
#import "OffersApiKeys.h"
#import "OffersDetails.h"

@interface OffersApi : APIBase

@property (strong, nonatomic) NSMutableArray *offers;

@end
