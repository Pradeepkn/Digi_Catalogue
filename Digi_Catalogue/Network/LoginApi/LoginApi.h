//
//  LoginApi.h
//  BrintDemo
//
//  Created by Pradeep on 17/10/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "APIBase.h"
#import "LoginDetails.h"

@interface LoginApi : APIBase

@property (nonatomic, strong) LoginDetails *loginDetails;

@end
