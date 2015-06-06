//
//  OffersApi.m
//  BrintDemo
//
//  Created by Tabrez on 27/09/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "OffersApi.h"


@implementation OffersApi


@synthesize offers;


- (id)init
{
    self = [super init];
    if (self) {
        //
        self.offers = [[NSMutableArray alloc] init];
    }
    return self;
}


#pragma mark -
#pragma mark - super class method.


- (NSString *)apiName
{
    return [NSString stringWithFormat:@"%@%@",[super apiName],kOffersApiUrl];
}


- (NSMutableDictionary *)createJsonObjectForRequest
{
    [super createJsonObjectForRequest];
    
    // Create request json object here..
    NSMutableDictionary *jsonObject = nil;
    
    return jsonObject;
}


- (void)checkForNilValues
{
    [super checkForNilValues];
}


+ (Class)offers_class
{
    return [OffersDetails class];
}



- (id)parseJsonObjectFromResponse:(id)response
{
    [super parseJsonObjectFromResponse:response];
    
    if (response == [NSNull null]) {
        return nil;
    }
    
    if (API_SUCESS != self.statusCode) {
        return nil;
    }
    
    NSDictionary *responseDict = [ParserUtility JSONObjectValue:response forKey:kResult];
    
    if ([responseDict respondsToSelector:@selector(objectForKey:)]) {
        
        NSMutableArray *array = [ParserUtility JSONObjectValue:responseDict forKey:kOffers];
        
        if (nil != array && [array count]) {
            
            for (NSDictionary *offersDict in array) {
                OffersDetails *details = [self parsedOffersDetails:offersDict];
                [self.offers addObject:details];
            }
        }
    }
    
    return nil;
}


- (OffersDetails *)parsedOffersDetails:(NSDictionary *)offersDict
{
    OffersDetails *details = [[OffersDetails alloc] init];
    
    details.jewellery_type = [ParserUtility JSONObjectValue:offersDict forKey:kJewelleryType];
    details.offer_type = [ParserUtility JSONObjectValue:offersDict forKey:kOfferType];
    details.offer_discount = [ParserUtility JSONObjectValue:offersDict forKey:kOfferDiscount];
    details.making_charge_discount = [ParserUtility JSONObjectValue:offersDict forKey:kMakingChargeDiscount];
    details.wastage_charge = [ParserUtility JSONObjectValue:offersDict forKey:kWastageCharge];
    details.offer_on_purity = [ParserUtility JSONObjectValue:offersDict forKey:kOfferOnPurity];
    details.offer_validity = [ParserUtility JSONObjectValue:offersDict forKey:kOfferValidity];
    details.offer_image = [ParserUtility JSONObjectValue:offersDict forKey:kOfferImage];
    
    return details;
}


@end
