//
//  ParserUtility.h
//  CabHoundPassenger
//
//  Created by Tarento technologies on 4/18/13.
//  Copyright (c) 2013 Tarento technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserUtility : NSObject

+ (id)JSONObjectValue:(id)jsonObject forKey:(NSString *)key;

+ (id)checkForNilObjectAssignEmptyValue:(id)object;

@end
