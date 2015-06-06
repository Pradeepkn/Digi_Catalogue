//
//  OffersDetails.h
//  BrintDemo
//
//  Created by Tabrez on 27/09/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Jastor.h>

@interface OffersDetails : Jastor

@property (strong, nonatomic) NSString *jewellery_type;
@property (strong, nonatomic) NSString *offer_type;
@property (strong, nonatomic) NSString *offer_discount;
@property (strong, nonatomic) NSString *making_charge_discount;
@property (strong, nonatomic) NSString *wastage_charge;
@property (strong, nonatomic) NSString *offer_on_purity;
@property (strong, nonatomic) NSString *offer_validity;
@property (strong, nonatomic) NSString *offer_image;

@end
