//
//  CollectionsApi.m
//  BrintDemo
//
//  Created by Pradeep on 28/11/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "CollectionsApi.h"
#import "Products.h"
#import "Items.h"
#import "CollectionsApiKeys.h"
#import "ListOfItems.h"

@implementation CollectionsApi


@synthesize collectionApiName;
@synthesize listOfItems;


- (id)init
{
    self = [super init];
    if (self) {
        //
    }
    return self;
}


#pragma mark -
#pragma mark - super class method.


- (NSString *)apiName
{
    return [NSString stringWithFormat:@"%@%@%@",[super apiName],kApiPrefix,collectionApiName];
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


+ (Class)listOfItems_class
{
    return [ListOfItems class];
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
        NSMutableArray *array = [ParserUtility JSONObjectValue:responseDict forKey:kCollection_ListOfItems];
        
        if (nil != array && [array count]) {
            self.listOfItems = [self parseListOfItemsFromResponse:responseDict];
        }
    }
    
    return nil;
}


- (NSMutableArray *)parseListOfItemsFromResponse:(NSDictionary *)responseDict
{
    NSMutableArray *itemsList = [[NSMutableArray alloc] init];
    
    NSMutableArray *array = [ParserUtility JSONObjectValue:responseDict forKey:kCollection_ListOfItems];
    
    for (NSDictionary *dict in array) {
        
        ListOfItems *listItem = [[ListOfItems alloc] init];
        
        listItem.CT = [ParserUtility JSONObjectValue:dict forKey:kCategory_Type];
        NSMutableArray *productsArray = [ParserUtility JSONObjectValue:dict forKey:kProducts];
        
        for (NSDictionary *dict in productsArray) {
            Products *details = [self parseProductsFromResponse:dict];
            [listItem.products addObject:details];
        }
        
        [itemsList addObject:listItem];
    }
    
    return itemsList;
}


- (Products *)parseProductsFromResponse:(NSDictionary *)responseDict
{
    
    Products *details = [[Products alloc] init];
    
    details.PT = [ParserUtility JSONObjectValue:responseDict forKey:kProduct_Type];
    
    NSMutableArray *productItemsArray = [ParserUtility JSONObjectValue:responseDict forKey:kItems];
    
    for (NSDictionary *dict in productItemsArray) {
        Items *itemDetails = [self parseItemsFromResponse:dict];
        [details.items addObject:itemDetails];
    }
    
    return details;
}


- (Items *)parseItemsFromResponse:(NSDictionary *)responseDict
{
    Items *itemDetails = [[Items alloc] init];
    
    itemDetails.clarity_name = [ParserUtility JSONObjectValue:responseDict forKey:kClarity_name];
    itemDetails.color_name = [ParserUtility JSONObjectValue:responseDict forKey:kColor_Name];
    itemDetails.design_type_name = [ParserUtility JSONObjectValue:responseDict forKey:kDesign_Type_Name];
    itemDetails.jewellery_type_name = [ParserUtility JSONObjectValue:responseDict forKey:kJewellery_Type_Name];
    itemDetails.name = [ParserUtility JSONObjectValue:responseDict forKey:kName];
    itemDetails.price = [ParserUtility JSONObjectValue:responseDict forKey:kPrice];
    itemDetails.ring_size_name = [ParserUtility JSONObjectValue:responseDict forKey:kRing_Size_Name];
    itemDetails.uri = [ParserUtility JSONObjectValue:responseDict forKey:kUri];
    itemDetails.wearing_style_name = [ParserUtility JSONObjectValue:responseDict forKey:kWearing_Style_Name];
    
    return itemDetails;
}


/*
 
 Result =     {
 errorCode = 0;
 errorMessage = Success;
 listOfItems =         (
 {
 CT = "Gold_jewellery";
 products =                 (
 {
 PT = "Ear Ring";
 items =                         (
 {
 "clarity_name" = "<null>";
 "color_name" = Yellow;
 "design_type_name" = Drop;
 "gender_name" = Female;
 "jewellery_type_name" = Gold;
 name = "Ear Ring";
 price = "32,000.00";
 "ring_size_name" = "<null>";
 uri = "http://brinvents.com/jew/sites/default/files/antique-annapakshi-gold-beads-jimmiki-32.jpg";
 "wearing_style_name" = "Casual Wear";
 }
 );
 },
 
 */




@end


