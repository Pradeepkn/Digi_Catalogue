//
//  ParserUtility.m
//  CabHoundPassenger
//
//  Created by Tarento technologies on 4/18/13.
//  Copyright (c) 2013 Tarento technologies. All rights reserved.
//

#import "ParserUtility.h"

@implementation ParserUtility


+ (id)JSONObjectValue:(id)jsonObject forKey:(NSString *)key
{
    if (([jsonObject valueForKey:key] != [NSNull null]) && (nil != [jsonObject valueForKey:key])) {
        return [jsonObject valueForKey:key];
    }
    return @"";
}


+ (id)checkForNilObjectAssignEmptyValue:(id)object
{
    if (nil != object && (object != [NSNull null])) {
        return object;
    }
    
    if (nil == object || object == [NSNull null]) {
        if ([object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSMutableString class]]) {
            return @"";
        }
        if ([object isKindOfClass:[NSNumber class]]) {
            [NSNumber numberWithInt:0];
        }
        
//        if ([object isKindOfClass:[NSArray class]]) {
//            [NSArray array];
//        }
//        if ([object isKindOfClass:[NSMutableArray class]]) {
//            [NSMutableArray array];
//        }

    }
    
    return [NSNull null];
}


@end
