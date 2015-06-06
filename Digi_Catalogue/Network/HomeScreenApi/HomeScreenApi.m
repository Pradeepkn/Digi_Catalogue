//
//  HomeScreenApi.m
//  BrintDemo
//
//  Created by Pradeep on 27/10/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "HomeScreenApi.h"

@implementation HomeScreenApi

@synthesize listOfItems, homeScreenImagesArray, defaultHomeScreenImagesArray;

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
    return [NSString stringWithFormat:@"%@%@",[super apiName],kHomeScreenApiUrl];
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


- (id)parseJsonObjectFromResponse:(id)response
{
    [super parseJsonObjectFromResponse:response];
    
    HomeScreenDetails *details = [[HomeScreenDetails alloc] init];

    if (response == [NSNull null]) {
        return nil;
    }
    
    if (API_SUCESS != self.statusCode) {
        return nil;
    }
    
    NSDictionary *responseDict = [ParserUtility JSONObjectValue:response forKey:kResult];
    
    if ([responseDict respondsToSelector:@selector(objectForKey:)]) {
        NSMutableArray *array = [ParserUtility JSONObjectValue:responseDict forKey:kHomeScreensImages];

        if (nil != array && [array count]) {
            self.homeScreenImagesArray = [[NSMutableArray alloc] init];
            for ( NSDictionary *homescreenDict in array) {
                details = [self parsedHomeScreenDetails:homescreenDict];
                [self.homeScreenImagesArray addObject:details];
            }
        }
    }
    
    return nil;
}


- (HomeScreenDetails *)parsedHomeScreenDetails:(NSDictionary *)offersDict
{
    HomeScreenDetails *details = [[HomeScreenDetails alloc] init];
    details.uri = [ParserUtility JSONObjectValue:offersDict forKey:kUrl];
    return details;
}

@end
